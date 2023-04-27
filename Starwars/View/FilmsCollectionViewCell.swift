//
//  FilmsCollectionViewCell.swift
//  Starwars
//
//  Created by Mohamed Brahem on 27/04/2023.
//

import UIKit

//Single cell for a character
final class FilmsCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "FilmsCollectionViewCellV"
    
    private let title: UILabel = {
        let title = UILabel()
        title.textColor = .secondaryLabel
        title.font = .systemFont(ofSize: 16, weight: .semibold)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(title)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
    }
    
    public func configure(with viewModal: FilmsCollectionViewCellViewModal){
        title.text = viewModal.filmTitle
    }
    
    
}
