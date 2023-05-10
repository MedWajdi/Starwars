//
//  FavoriteTableViewCellViewModal.swift
//  Starwars
//
//  Created by Mohamed Brahem on 09/05/2023.
//

import Foundation
import UIKit

final class FavoriteTableViewCellViewModal {

    // MARK: - Propriets

    public let titleLabel: String
    public let filmPoster: String

    // MARK: - Init

    init(titleLabel: String, filmPoster: String) {
        self.titleLabel = titleLabel
        self.filmPoster = filmPoster
    }

}
