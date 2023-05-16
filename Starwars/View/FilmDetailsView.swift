//
//  FilmDetailsView.swift
//  Starwars
//
//  Created by Mohamed Brahem on 12/05/2023.
//

import UIKit

final class FilmDetailsView: UIView {

    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    var title: UILabel = {
        let title = UILabel()
        title.textColor = .label
        title.font = .systemFont(ofSize: 18, weight: .semibold)
        title.numberOfLines = 0
        title.lineBreakMode = .byWordWrapping
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    var releaseDate: UILabel = {
        let releaseDate = UILabel()
        releaseDate.textColor = .label
        releaseDate.font = .systemFont(ofSize: 18, weight: .semibold)
        releaseDate.numberOfLines = 0
        releaseDate.lineBreakMode = .byWordWrapping
        return releaseDate
    }()

    var director: UILabel = {
        let director = UILabel()
        director.textColor = .label
        director.font = .systemFont(ofSize: 18, weight: .semibold)
        director.numberOfLines = 0
        director.lineBreakMode = .byWordWrapping
        return director
    }()

    var producers: UILabel = {
        let producers = UILabel()
        producers.textColor = .label
        producers.font = .systemFont(ofSize: 18, weight: .semibold)
        producers.numberOfLines = 0
        producers.lineBreakMode = .byWordWrapping
        return producers
    }()

    var characters: UILabel = {
        let characters = UILabel()
        characters.textColor = .label
        characters.font = .systemFont(ofSize: 18, weight: .semibold)
        characters.numberOfLines = 0
        characters.lineBreakMode = .byWordWrapping
        return characters
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        addConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubViews(imageView, title, releaseDate, director, producers, characters)
    }

    private func addConstraints() {

        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            // $0.width.equalTo(scrollView.snp.width)
            $0.width.equalToSuperview()
            // Set the content size for the scrollView
            $0.bottom.equalToSuperview()
        }

        // Set constraints for the image view
        imageView.snp.makeConstraints {
            $0.top.equalTo(0)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            // $0.width.equalToSuperview().offset(-60)
            $0.height.equalTo(350)
        }

        // Set constraints for the title label
        title.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.top.equalTo(imageView.snp.bottom).offset(10)
        }

        // Set constraints for the release date label
        releaseDate.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.top.equalTo(title.snp.bottom).offset(10)
        }

        // Set constraints for the director label
        director.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.top.equalTo(releaseDate.snp.bottom).offset(10)
        }

        // Set constraints for the producers label
        producers.snp.makeConstraints {
            // $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.top.equalTo(director.snp.bottom).offset(10)
        }

        // Set constraints for the characters label
        characters.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.top.equalTo(producers.snp.bottom).offset(10)
            $0.bottom.equalTo(scrollView.snp.bottom)
        }
    }
}
