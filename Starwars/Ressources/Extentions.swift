//
//  Extentions.swift
//  Starwars
//
//  Created by Mohamed Brahem on 02/05/2023.
//

import UIKit

extension UIView {
    func  addSubViews(_ views: UIView... ) {
        views.forEach({
            addSubview($0)
        })
    }
}
