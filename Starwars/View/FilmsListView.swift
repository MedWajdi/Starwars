//
//  FilmsListView.swift
//  Starwars
//
//  Created by Mohamed Brahem on 27/04/2023.
//

import UIKit

// this view handles showing list of characters
final class FilmsListView: UIView {

    private let viewModal = FilmsListViewViewModal()

    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isHidden = true
        collectionView.alpha = 0
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(FilmsCollectionViewCell.self,
                            forCellWithReuseIdentifier: FilmsCollectionViewCell.cellIdentifier)

        return collectionView
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubViews(collectionView, spinner)
        addConstraints()
        spinner.startAnimating()
        // receving side of delegate toggle
        viewModal.delegate = self
        viewModal.fetchFilms()
        setUpCollectionView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func setUpCollectionView() {
        collectionView.dataSource = viewModal
        collectionView.delegate = viewModal
    }
}

extension FilmsListView: FilmsListViewViewModalDelegate {
    func didLoadInitalFilms() {
        spinner.stopAnimating()
        collectionView.isHidden = false
        collectionView.reloadData() // Reload for the initial fetch of data

        UIView.animate(withDuration: 0.4) {
            self.collectionView.alpha = 1
        }
    }
}
