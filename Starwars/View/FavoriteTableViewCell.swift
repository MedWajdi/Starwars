//
//  FavoriteTableViewCell.swift
//  Starwars
//
//  Created by Mohamed Brahem on 09/05/2023.
//

import Foundation
import UIKit
import Combine

final class FavoriteTableViewCell: UITableViewCell {

    // MARK: - Properties

    public var cellDisposables = Set<AnyCancellable>()

    // MARK: - Subviews

    let filmPoster: UIImageView = {
        let filmPoster = UIImageView()
        filmPoster.contentMode = .scaleToFill
        filmPoster.clipsToBounds = true
        // filmPoster.layer.cornerRadius = Constants.imageSize/2
        return filmPoster
    }()

    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .label
        titleLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
    }

    required init?(coder: NSCoder) { nil }

    // MARK: - Lifecycle

    override func prepareForReuse() {
        titleLabel.text = nil
        filmPoster.image = UIImage(named: "movies-film-cinema-movie-theater")
        cellDisposables.forEach { $0.cancel() }
    }

    // MARK: - Setup
    public func config(with viewModal: FavoriteTableViewCellViewModal) {
        filmPoster.image = UIImage(named: viewModal.filmPoster)
        titleLabel.text = viewModal.titleLabel
    }

    func setupConstraints() {
        filmPoster.snp.makeConstraints {
            $0.size.equalTo(Constants.imageSize)
        }
    }
}

extension FavoriteTableViewCell {
    enum Constants {
        static let imageSize: CGFloat = 50.0
        static let cellHeight: CGFloat = 120.0
    }
}
