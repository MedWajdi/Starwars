//
//  FilmsCollectionViewCellViewModal.swift
//  Starwars
//
//  Created by Mohamed Brahem on 27/04/2023.
//

import UIKit


final class FilmsCollectionViewCellViewModal  {
    
    //MARK: -Propriets
    
    public let filmTitle: String
    private let filmImage: String
    
    
    // MARK: -Init
    
    init(filmTitle: String,filmImage: String) {
        self.filmTitle = filmTitle
        self.filmImage = filmImage
    }
    
}

