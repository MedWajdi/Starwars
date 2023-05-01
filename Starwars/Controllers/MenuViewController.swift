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
        FilmsListViewViewModal().fetchFilms()
        
    }
    
    private func setUpView(){
        view.addSubview(filmsListView)
        
    }
    
}
