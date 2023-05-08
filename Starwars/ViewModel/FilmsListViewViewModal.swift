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
    
    private var filmsList : [Film] = [] {
        didSet {
            for film in filmsList {
                let viewModal = FilmsCollectionViewCellViewModal(filmTitle: (film.title)!, filmImage: "movies-film-cinema-movie-theater")
                //print(film.title)
                cellViewModals.append(viewModal)
            }
        }
    }
    
    private var cellViewModals : [FilmsCollectionViewCellViewModal] = []
    
    // MARK: fetching data needed
    func fetchFilms() {
        Network.shared.apolloClient.fetch(query: GraphQL.GetAllFilmsQuery()) { result in
            guard let data = try? result.get().data else { return }
            
            if let allFilms = data.allFilms?.films {
                let films = allFilms.map { Film($0) }
                self.filmsList = films
                
                DispatchQueue.main.async {
                    self.delegate?.DidLoadInitalFilms()
                }
            }
        }
        // MARK: TODO
        //===================
            
        //===================
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
