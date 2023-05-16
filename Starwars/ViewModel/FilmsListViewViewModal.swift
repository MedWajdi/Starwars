//
//  FilmsListViewViewModal.swift
//  Starwars
//
//  Created by Mohamed Brahem on 27/04/2023.
//

import UIKit

protocol FilmsListViewViewModalDelegate: AnyObject {
    func didLoadInitalFilms(_ films: [Film])
}

class FilmsListViewViewModal {

    // MARK: - Propriety

    var filmsListViewViewModalDelegate: FilmsListViewViewModalDelegate?

    // MARK: - fetching data needed

    func fetchFilms() {
        Network.shared.apolloClient.fetch(query: GraphQL.GetAllFilmsQuery()) { result in
            guard let data = try? result.get().data else { return }
            if let allFilms = data.allFilms?.films {
                let films = allFilms.map { Film($0) }
                DispatchQueue.main.async {
                    self.filmsListViewViewModalDelegate?.didLoadInitalFilms(films)
                }
            }
        }
    }
}
