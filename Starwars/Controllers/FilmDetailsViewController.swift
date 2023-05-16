//
//  FilmDetailsViewController.swift
//  Starwars
//
//  Created by Mohamed Brahem on 12/05/2023.
//

import UIKit

final class FilmDetailsViewController: UIViewController {

    private var filmDetailsView = FilmDetailsView()
    var recivedFilm: Film!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Details"
    }

    init(recivedFilm: Film!) {
        super.init(nibName: nil, bundle: nil)
        self.recivedFilm = recivedFilm
        fetchData()
        setUpView()
        // view.addSubview(filmDetailsView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setUpView() {
        view.addSubview(filmDetailsView)
        filmDetailsView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.top.bottom.trailing.leading.equalToSuperview()
        }
    }

    private func fetchData() {
        if let imageName = recivedFilm.title, let image = UIImage(named: imageName) {
            filmDetailsView.imageView.image = image
            print(imageName)
        } else {
            filmDetailsView.imageView = UIImageView(image: UIImage(named: "movies-film-cinema-movie-theater"))
        }
        filmDetailsView.title.text = "🎞 Film Title: \n" + (recivedFilm.title ?? "")
        filmDetailsView.releaseDate.text = "🗓 Relese Date: \n" + (recivedFilm.releaseDate ?? "")
        filmDetailsView.director.text = "👨🏼‍🦰 Director: \n" + (recivedFilm.director ?? "")

        let optionalProducerNames: [String?] = recivedFilm.producers ?? []
        let nonOptionalProducerNames = optionalProducerNames.compactMap { $0 }
        // nonOptionalProducerNames is now ["Gary Kurtz", "Rick McCallum"]
        filmDetailsView.producers.text = "👨🏼‍🦰 Producers: \n" + nonOptionalProducerNames.joined(separator: "\n")

        let optionalCharacters: [String?] = recivedFilm.characterConnection?.characters?.map { $0?.name } ?? []
        let characters = optionalCharacters.compactMap { $0 }.joined(separator: "\n")
        filmDetailsView.characters.text = "👨🏼‍🦰 Characters: \n" + characters
    }

}
