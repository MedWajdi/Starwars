//
//  CharacterConnection.swift
//  Starwars
//
//  Created by Mohamed Brahem on 01/05/2023.
//

import Foundation

public typealias GraphQLCharacterConnection = GraphQL.GetAllFilmsQuery.Data.AllFilms.Film.CharacterConnection

public struct CharacterConnection: Hashable {

    // MARK: - Properties

    public var characters: [Character?]? = []
    public let totalCount: Int?

    // MARK: - Initialization

    public init(_ characterConnection: GraphQLCharacterConnection?) {
        if let characters = characterConnection?.characters {
            self.characters = characters.map { Character($0)}
        }
self.totalCount = characterConnection?.totalCount
    }
}
