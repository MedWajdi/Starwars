//
//  FilmsListViewViewModal.swift
//  Starwars
//
//  Created by Mohamed Brahem on 27/04/2023.
//

import UIKit

protocol FilmsListViewViewModalDelegate:AnyObject {
    func DidLoadInitalFilms()
}

final class FilmsListViewViewModal :NSObject {
    public weak var delegate : FilmsListViewViewModalDelegate?
    
    private var films : [Film] = [] {
        didSet {
            for film in films {
                let viewModal = FilmsCollectionViewCellViewModal(filmTitle: film.title)
                cellViewModals.append(viewModal)
            }
        }
    }
    
    private var cellViewModals : [FilmsCollectionViewCellViewModal] = []
    
    //MARK:: fetchin data needed here
    private func fetchCharacters() {
        
    }
    
}

extension FilmsListViewViewModal:UICollectionViewDataSource ,UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModals.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilmsCollectionViewCell.cellIdentifier, for: indexPath) as? FilmsCollectionViewCell else {
                fatalError("Unsupported cell")
            }
        
        let viewModal = cellViewModals[indexPath.row]
        cell.configure(with: viewModal)
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width=(bounds.width-30)/2
        return CGSize(width: width, height: width*1.5)
    }
    
}
