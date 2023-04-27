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

final class FavoriteViewController : UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Favorite"
        print("==============================")
        getData()
        print("==============================")

    }
    
    
    private func getData(){
        Network.shared.apolloClient.fetch(query: GraphQL.GetAllFilmsQuery()) { result in
            print(result)
            guard let data = try? result.get().data else { return }
            
            print(data.allFilms as Any)
            if let films = data.allFilms?.films {
                    print(films)
            }
            
        }
        
    }
    
    
    
}
