//
//  FilmsCollectionViewCell.swift
//  Starwars
//
//  Created by Mohamed Brahem on 27/04/2023.
//

import UIKit

// Single cell for a character
final class FilmsCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "FilmsCollectionViewCellV"

    private let title: UILabel = {
        let title = UILabel()
        title.textColor = .label
        title.font = .systemFont(ofSize: 18, weight: .semibold)
        title.numberOfLines = 0
        title.lineBreakMode = .byWordWrapping
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let detailsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = CGFloat(8.0)
        stackView.alignment = .center
        return stackView
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubViews(imageView, title)
        addConstraints()
        setUpLayer()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpLayer() {
        contentView.layer.cornerRadius = 8
        contentView.layer.shadowColor = UIColor.label.cgColor
        contentView.layer.cornerRadius = 4
        contentView.layer.shadowOffset = CGSize(width: -4, height: 4)
        contentView.layer.shadowOpacity = 0.3
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: title.topAnchor, constant: -3),
            title.heightAnchor.constraint(equalToConstant: 50),
            title.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 7),
            title.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -7),
            title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        title.text = nil
    }

    public func configure(with viewModal: FilmsCollectionViewCellViewModal) {
        imageView.image = UIImage(named: viewModal.filmTitle)
        title.text = viewModal.filmTitle
    }

}
