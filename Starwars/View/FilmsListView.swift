//
//  FilmsListView.swift
//  Starwars
//
//  Created by Mohamed Brahem on 27/04/2023.
//

import UIKit

//this view handles showing list of characters
final class FilmsListView: UIView {
    
    private let viewModal = FilmsListViewViewModal()
    
    private let spinner : UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top:0,left:10,bottom:10,right:10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isHidden = true
        collectionView.alpha = 0
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(FilmsCollectionViewCell.self, forCellWithReuseIdentifier: FilmsCollectionViewCell.cellIdentifier)

        return collectionView
    }()
    
    private func setUpCollectionView(){
        collectionView.dataSource = viewModal
        collectionView.delegate = viewModal
    }
    
}

extension FilmsListView: FilmsListViewViewModalDelegate {
    func DidLoadInitalFilms() {
        spinner.stopAnimating()
        collectionView.isHidden = false
        collectionView.reloadData()
        
        UIView.animate(withDuration: 0.4){
            self.collectionView.alpha = 1
        }
    }
}
