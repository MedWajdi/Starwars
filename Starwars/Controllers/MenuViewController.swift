//
//  MenuController.swift
//  Starwars
//
//  Created by Mohamed Brahem on 25/04/2023.
//

import UIKit

final class MenuViewController: UIViewController {
    private let filmsListView = FilmsListView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Menu"
        setUpView()
    }

    private func setUpView() {
        view.addSubview(filmsListView)
        NSLayoutConstraint.activate([
            filmsListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            filmsListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            filmsListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            filmsListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }

}
