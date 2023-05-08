//
//  publishers+GraphQL.swift
//  Starwars
//
//  Created by Mohamed Brahem on 04/05/2023.
//

import Apollo
import Combine

public extension Publishers {

    // MARK: - Fetch

    struct GraphQLFetch<Query: GraphQLQuery>: Publisher {
        public typealias Output = GraphQLResult<Query.Data>
        public typealias Failure = Error
        
        private let client: ApolloClient
        private let query: Query
        private let cachePolicy: CachePolicy
        
        // MARK: - Initialization

        init(client: ApolloClient, query: Query, cachePolicy: CachePolicy) {
            self.client = client
            self.query = query
            self.cachePolicy = cachePolicy
        }

        public func receive<S: Subscriber>(subscriber: S) where Failure == S.Failure, Output == S.Input {
            let subscription = GraphQLFetchSubscription(subscriber: subscriber, query: query, cachePolicy: cachePolicy, client: client)
            subscriber.receive(subscription: subscription)
        }
    }

    private final class GraphQLFetchSubscription<S: Subscriber, Query: GraphQLQuery>:
                            Subscription where S.Failure == Error, S.Input == GraphQLResult<Query.Data> {
        private let client: ApolloClient
        private let query: Query
        private let cachePolicy: CachePolicy
        private var subscriber: S?
        private var task: Apollo.Cancellable?

        init(subscriber: S, query: Query, cachePolicy: CachePolicy, client: ApolloClient) {
            self.subscriber = subscriber
            self.query = query
            self.client = client
            self.cachePolicy = cachePolicy
        }

        func request(_ demand: Subscribers.Demand) {
            task = client.fetch(query: query, cachePolicy: cachePolicy)
            { [weak self] result in
                switch result {
                case .success(let data):
                    _ = self?.subscriber?.receive(data)
                    self?.subscriber?.receive(completion: .finished)
                case .failure(let error):
                    self?.subscriber?.receive(completion: .failure(error))
                }
            }
        }

        func cancel() {
            task?.cancel()
            task = nil
            subscriber = nil
        }
    }
}
