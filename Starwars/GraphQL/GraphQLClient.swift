//
//  GraphQLClient.swift
//  Starwars
//
//  Created by Mohamed Brahem on 08/05/2023.
//

import Combine
import Foundation
import Apollo
import ApolloAPI
import ComposableArchitecture
import OSLog

public struct GraphQLClient {
    // MARK: - Properties

    public var client: ApolloClient!
    public let error: GraphQLClientError?
    private var performResponses: [Int: Any] = [:]
    private var fetchResponses: [Int: Any] = [:]
    let logger = Logger()

    // MARK: - Fetch

public func fetch<Query: GraphQLQuery>(_ query: Query,
                                       cachePolicy: CachePolicy = .fetchIgnoringCacheCompletely) ->
                                       EffectPublisher<GraphQLResult<Query.Data>, Error> {
        if let error = error {
            return Fail<GraphQLResult<Query.Data>, Error>(error: error)
                .eraseToEffect()
        }

        let fetchResult: EffectPublisher<GraphQLResult<Query.Data>, Error>

        if let response = fetchResponses[query.hashValue] as? EffectPublisher<GraphQLResult<Query.Data>, Error> {
            fetchResult = response
        } else {
            fetchResult = Publishers.GraphQLFetch(client: client, query: query, cachePolicy: cachePolicy)
                .eraseToEffect()
        }

        return fetchResult
            .tryMap { result in
                if let errors = result.errors {
                    // Check for 404 error
                    for error in errors {
                        if error.message == Constants.notFoundErrorString {
                            throw GraphQLClientError.notFound
                        }
                    }

                    throw GraphQLClientError.serverError
                }

                return result
            }
            .handleEvents(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    logger.error("GraphQL fetch failed: \(error.localizedDescription)")
                }
            })
            .eraseToEffect()
    }

    // MARK: - Initialization

public init(client: ApolloClient!,
            error: GraphQLClientError?,
            performResponses: [Int: Any],
            fetchResponses: [Int: Any]) {
        self.client = client
        self.error = error
        self.performResponses = performResponses
        self.fetchResponses = fetchResponses
    }
}

private extension GraphQLClient {
    enum Constants {
        static let notFoundErrorString = "404: Not Found"
    }
}

public extension GraphQLClient {
    enum GraphQLClientError: Error {
        case decodingError
        case unknown
        case notFound
        case serverError
    }
}

extension GraphQLClient {
    public mutating func overrideFetch<Query: GraphQLQuery>(
        query matchingQuery: Query,
        withResponse response: EffectPublisher<GraphQLResult<Query.Data>, Error>
    ) {
        self.fetchResponses[matchingQuery.hashValue] = response
    }
}
