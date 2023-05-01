//
//  Character.swift
//  Starwars
//
//  Created by Mohamed Brahem on 01/05/2023.
//

import Foundation

public typealias GraphQLCharacter = GraphQL.GetAllFilmsQuery.Data.AllFilms.Film.CharacterConnection.Character


public struct Character : Hashable {

    // MARK: - Properties

    public let id : String?
    public let name : String?
    public let birthYear : String?


    // MARK: - Initialization

    public init(_ character : GraphQLCharacter?) {
        self.id = character?.id
        self.name = character?.name
        self.birthYear = character?.birthYear
    }

}
