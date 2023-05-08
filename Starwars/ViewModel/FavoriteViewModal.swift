//
//  FavoriteViewModal.swift
//  Starwars
//
//  Created by Mohamed Brahem on 04/05/2023.
//

import Foundation
import Combine
import ComposableArchitecture
import OSLog


protocol FavoriteViewModalInputs {
    func fetchFilms()
}

protocol FavoriteViewModalOutputs {
    var films: Effect<[Film], Never> { get }
}

protocol FavoriteViewModalType {
    var inputs: FavoriteViewModalInputs { get }
    var outputs: FavoriteViewModalOutputs { get }
}

final class FavoriteViewModal: FavoriteViewModalInputs, FavoriteViewModalOutputs {

    // MARK: - Properties
    private let filmsClient : GraphQLClient
    private let mainQueue: AnySchedulerOf<DispatchQueue>
    private let logger = Logger()
    private let filmsSubject: CurrentValueSubject<[Film], Never> = .init([])
    private var disposables = Set<AnyCancellable>()
    
    
    // MARK: - Inputs
    
    func fetchFilms() {
        //Network.shared.apolloClient.fetch(query: GraphQL.GetAllFilmsQuery())
        filmsClient.fetchFilms()
            .receive(on: mainQueue)
            .sink(receiveCompletion: {completion in
                if case .failure(let error) = completion {
                    self.logger.error("Unable to remove item to wishlist \(error)")
                }
            }, receiveValue: { [weak self] values in
                self?.filmsSubject.send(values)
            })
            .store(in: &disposables)
    }
    
    // MARK: - Outputs
    
    var films: Effect<[Film], Never> {
        filmsSubject.eraseToEffect()
    }
    
    // MARK: - Initialization

    init(
        mainQueue: AnySchedulerOf<DispatchQueue>,
        filmsClient: GraphQLClient
    ) {
        self.mainQueue = mainQueue
        self.filmsClient = filmsClient
    }
    
    
}

extension FavoriteViewModal: FavoriteViewModalType {

    var inputs: FavoriteViewModalInputs {
        self
    }

    var outputs: FavoriteViewModalOutputs {
        self
    }
}

extension FavoriteViewModal {
    enum Constants {
        static let timerId = "saleTimerTask"
        static let changeSaleInterval: TimeInterval = 5.0
    }
}
