//
//  filmsClient.swift
//  Starwars
//
//  Created by Mohamed Brahem on 04/05/2023.
//

import ComposableArchitecture

public enum FetchClientError: Error {
    case postNotFound
}

public extension GraphQLClient {
    func fetchFilms() -> Effect<[Film],Error> {
        let query = GraphQL.GetAllFilmsQuery()
        
        return fetch(query)
            .mapError { error in
                guard let graphQLError = error as? GraphQLClientError else {
                    return error
                }
                
                switch graphQLError {
                case .notFound:
                    return FetchClientError.postNotFound
                default:
                    return error
                }
                
            }
            .tryMap { result in
                guard let films = result.data?.allFilms?.films else {
                    throw GraphQLClientError.decodingError
                }
                //guard let film = result. else {
                //}
                //return Film(film)
                return films.map { Film($0) }
            }
             .eraseToEffect()
        
    }
}



public struct FilmsClient {
    public var fetchFilm: ((() -> Void)?) -> Effect<[Film], Never>
}

public extension FilmsClient {
    static let noop = Self(
        fetchFilm: { _ in .none}
    )
    
    
    
}
