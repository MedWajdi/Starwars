//
//  MenuController.swift
//  Starwars
//
//  Created by Mohamed Brahem on 25/04/2023.
//

import UIKit

final class MenuViewController: UIViewController {

    // MARK: - Properties
    let viewModal = FilmsListViewViewModal()
    private var filmsListView = FilmsListView()
    private var cellViewModals: [FilmsCollectionViewCellViewModal] = []
    private var filmsList: [Film] = [] {
        didSet {
            for film in filmsList {
                let viewModal = FilmsCollectionViewCellViewModal(filmTitle: (film.title)!,
                                                                 filmImage: "movies-film-cinema-movie-theater")
                cellViewModals.append(viewModal)
             }
        }
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Menu"
        setUpView()
        fetchFilms()
        viewModal.filmsListViewViewModalDelegate = self
        filmsListView.collectionView.dataSource = self
        filmsListView.collectionView.delegate = self
    }

    // MARK: - Setup

    private func setUpView() {
        view.addSubview(filmsListView)
        NSLayoutConstraint.activate([
            filmsListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            filmsListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            filmsListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            filmsListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }

    private func fetchFilms() {
        viewModal.fetchFilms()
    }
}

extension MenuViewController: FilmsListViewViewModalDelegate {
    func didLoadInitalFilms(_ films: [Film]) {
        self.filmsList = films
        self.filmsListView.collectionView.reloadData()
        self.filmsListView.spinner.stopAnimating()
    }
}

extension MenuViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModals.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilmsCollectionViewCell.cellIdentifier,
                                                            for: indexPath) as? FilmsCollectionViewCell else {
                fatalError("Unsupported cell")
            }
        let viewModal = cellViewModals[indexPath.row]
        // it refers to configure in FilmsCollectionViewCell
        cell.configure(with: viewModal)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width-30)/2
        return CGSize(width: width, height: width*1.5)
    }
}
