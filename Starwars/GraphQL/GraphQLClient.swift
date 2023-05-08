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

    public func fetch<Query: GraphQLQuery>(_ query: Query, cachePolicy: CachePolicy = .fetchIgnoringCacheCompletely) -> Effect<GraphQLResult<Query.Data>, Error> {
        if let error = error {
            return Fail<GraphQLResult<Query.Data>, Error>(error: error)
                .eraseToEffect()
        }

        let fetchResult: Effect<GraphQLResult<Query.Data>, Error>

        if let response = fetchResponses[query.hashValue] as? Effect<GraphQLResult<Query.Data>, Error> {
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
    
    public init(client: ApolloClient!, error: GraphQLClientError?, performResponses: [Int : Any], fetchResponses: [Int : Any]) {
        self.client = client
        self.error = error
        self.performResponses = performResponses
        self.fetchResponses = fetchResponses
    }
    

    /*public init(host: URLHost, userDefaultsClient: UserDefaultsClient, error: GraphQLClientError? = nil) {
        let url =  URL(string: host.rawValue)
        let store = ApolloStore()
        let interceptorProvider = NetworkInterceptorsProvider(
            interceptors: [
                AuthInterceptor(userDefaultsClient: userDefaultsClient),
                UserTrackingInterceptor(userTrackingId: userDefaultsClient.userTrackingId)
            ],
            store: store
        )
        let networkTransport = RequestChainNetworkTransport(
            interceptorProvider: interceptorProvider, endpointURL: url!
        )
        self.client = ApolloClient(networkTransport: networkTransport, store: store)
        self.error = error
    }*/
    
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

/*
extension GraphQLClient {
    public static let noop = Self (host: .default, userDefaultsClient: .noop)
    public static let error = Self (host: .default, userDefaultsClient: .noop, error: .unknown)
}
*/

extension GraphQLClient {
    public mutating func overrideFetch<Query: GraphQLQuery>(
        query matchingQuery: Query,
        withResponse response: Effect<GraphQLResult<Query.Data>, Error>
    ) {
        self.fetchResponses[matchingQuery.hashValue] = response
    }
}

