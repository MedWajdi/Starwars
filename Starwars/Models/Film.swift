//
//  Film.swift
//  Starwars
//
//  Created by Mohamed Brahem on 25/04/2023.
//

import Foundation

public typealias GraphQLFilm = GraphQL.GetAllFilmsQuery.Data.AllFilms.Film

public struct Film: Hashable {
    // MARK: - Properties
    public let id: String?
    public let title: String?
    public let releaseDate: String?
    public let created: String?
    public let director: String?
    public let edited: String?
    public let episodeID: Int?
    public let openingCrawl: String?
    public let producers: [String?]?
    public let characterConnection: CharacterConnection?

    // MARK: - Initialization

    public init(_ film: GraphQLFilm?) {
        self.id = film?.id
        self.title = film?.title
        self.releaseDate = film?.releaseDate
        self.created = film?.created
        self.director = film?.director
        self.edited = film?.edited
        self.episodeID = film?.episodeID
        self.openingCrawl = film?.openingCrawl
        self.producers = film?.producers
        self.characterConnection = CharacterConnection(film?.characterConnection)
    }
    /*
    public init(_ film: Film) {
        self.id = film.id
        self.title = film.title
        self.releaseDate = film.releaseDate
        self.created = film.created
        self.director = film.director
        self.edited = film.edited
        self.episodeID = film.episodeID
        self.openingCrawl = film.openingCrawl
        self.producers = film.producers
        self.characterConnection = film.characterConnection
    }
     */
}
