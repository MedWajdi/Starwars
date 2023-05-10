//
//  FavoriteController.swift
//  Starwars
//
//  Created by Mohamed Brahem on 25/04/2023.
//

import Foundation
import UIKit
import Apollo
import ApolloAPI
import SnapKit
import Combine

final class FavoriteViewController: UITableViewController {

    // MARK: - Properties

    let cellId = "cellId"
    var films: [Film] = []
    private let viewModal = FavoriteViewModal(
        mainQueue: .main,
        filmsClient: GraphQLClient(client: Network.shared.apolloClient,
                                   error: nil,
                                   performResponses: [:],
                                   fetchResponses: [:]
                                  )
    )
    public var disposables = Set<AnyCancellable>()
    private let favoriteView = FavoriteView()
    private var didFetchInitialData = false

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Favorite"
        viewModal.inputs.fetchFilms()
        setupBindings()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    // MARK: - Setup

    private func setupView() {
        view.addSubview(favoriteView)
        favoriteView.tableView.separatorStyle = .none
    }

    private func setupBindings() {
        viewModal.outputs.films
            .sink { [weak self]  in
                // populate videw with reveived value
                self?.films.append(contentsOf: $0)
                //print(self?.films)
                self?.tableView.reloadData()
            }
            .store(in: &disposables)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let currentLastItem = films[indexPath.row]
        cell.imageView?.image = UIImage(named: currentLastItem.title!)
        cell.textLabel?.text = currentLastItem.title

        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
