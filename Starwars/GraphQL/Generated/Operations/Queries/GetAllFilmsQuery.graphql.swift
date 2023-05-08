// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension GraphQL {
  class GetAllFilmsQuery: GraphQLQuery {
    public static let operationName: String = "GetAllFilms"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query GetAllFilms {
          allFilms {
            __typename
            films {
              __typename
              characterConnection {
                __typename
                characters {
                  __typename
                  birthYear
                  id
                  name
                }
                totalCount
              }
              created
              director
              edited
              episodeID
              id
              openingCrawl
              producers
              releaseDate
              title
            }
          }
        }
        """#
      ))

    public init() {}

    public struct Data: GraphQL.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ApolloAPI.ParentType { GraphQL.Objects.Root }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("allFilms", AllFilms?.self),
      ] }

      public var allFilms: AllFilms? { __data["allFilms"] }

      /// AllFilms
      ///
      /// Parent Type: `FilmsConnection`
      public struct AllFilms: GraphQL.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ApolloAPI.ParentType { GraphQL.Objects.FilmsConnection }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("films", [Film?]?.self),
        ] }

        /// A list of all of the objects returned in the connection. This is a convenience
        /// field provided for quickly exploring the API; rather than querying for
        /// "{ edges { node } }" when no edge data is needed, this field can be be used
        /// instead. Note that when clients like Relay need to fetch the "cursor" field on
        /// the edge to enable efficient pagination, this shortcut cannot be used, and the
        /// full "{ edges { node } }" version should be used instead.
        public var films: [Film?]? { __data["films"] }

        /// AllFilms.Film
        ///
        /// Parent Type: `Film`
        public struct Film: GraphQL.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { GraphQL.Objects.Film }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("characterConnection", CharacterConnection?.self),
            .field("created", String?.self),
            .field("director", String?.self),
            .field("edited", String?.self),
            .field("episodeID", Int?.self),
            .field("id", GraphQL.ID.self),
            .field("openingCrawl", String?.self),
            .field("producers", [String?]?.self),
            .field("releaseDate", String?.self),
            .field("title", String?.self),
          ] }

          public var characterConnection: CharacterConnection? { __data["characterConnection"] }
          /// The ISO 8601 date format of the time that this resource was created.
          public var created: String? { __data["created"] }
          /// The name of the director of this film.
          public var director: String? { __data["director"] }
          /// The ISO 8601 date format of the time that this resource was edited.
          public var edited: String? { __data["edited"] }
          /// The episode number of this film.
          public var episodeID: Int? { __data["episodeID"] }
          /// The ID of an object
          public var id: GraphQL.ID { __data["id"] }
          /// The opening paragraphs at the beginning of this film.
          public var openingCrawl: String? { __data["openingCrawl"] }
          /// The name(s) of the producer(s) of this film.
          public var producers: [String?]? { __data["producers"] }
          /// The ISO 8601 date format of film release at original creator country.
          public var releaseDate: String? { __data["releaseDate"] }
          /// The title of this film.
          public var title: String? { __data["title"] }

          /// AllFilms.Film.CharacterConnection
          ///
          /// Parent Type: `FilmCharactersConnection`
          public struct CharacterConnection: GraphQL.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ApolloAPI.ParentType { GraphQL.Objects.FilmCharactersConnection }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("characters", [Character?]?.self),
              .field("totalCount", Int?.self),
            ] }

            /// A list of all of the objects returned in the connection. This is a convenience
            /// field provided for quickly exploring the API; rather than querying for
            /// "{ edges { node } }" when no edge data is needed, this field can be be used
            /// instead. Note that when clients like Relay need to fetch the "cursor" field on
            /// the edge to enable efficient pagination, this shortcut cannot be used, and the
            /// full "{ edges { node } }" version should be used instead.
            public var characters: [Character?]? { __data["characters"] }
            /// A count of the total number of objects in this connection, ignoring pagination.
            /// This allows a client to fetch the first five objects by passing "5" as the
            /// argument to "first", then fetch the total count so it could display "5 of 83",
            /// for example.
            public var totalCount: Int? { __data["totalCount"] }

            /// AllFilms.Film.CharacterConnection.Character
            ///
            /// Parent Type: `Person`
            public struct Character: GraphQL.SelectionSet {
              public let __data: DataDict
              public init(data: DataDict) { __data = data }

              public static var __parentType: ApolloAPI.ParentType { GraphQL.Objects.Person }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("birthYear", String?.self),
                .field("id", GraphQL.ID.self),
                .field("name", String?.self),
              ] }

              /// The birth year of the person, using the in-universe standard of BBY or ABY -
              /// Before the Battle of Yavin or After the Battle of Yavin. The Battle of Yavin is
              /// a battle that occurs at the end of Star Wars episode IV: A New Hope.
              public var birthYear: String? { __data["birthYear"] }
              /// The ID of an object
              public var id: GraphQL.ID { __data["id"] }
              /// The name of this person.
              public var name: String? { __data["name"] }
            }
          }
        }
      }
    }
  }

}