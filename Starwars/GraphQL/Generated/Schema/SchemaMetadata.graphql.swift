// @generated
// This file was automatically generated and should not be edited.
// swiftlint:disable all

import ApolloAPI

public protocol GraphQL_SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == GraphQL.SchemaMetadata {}

public protocol GraphQL_InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == GraphQL.SchemaMetadata {}

public protocol GraphQL_MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == GraphQL.SchemaMetadata {}

public protocol GraphQL_MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == GraphQL.SchemaMetadata {}

public extension GraphQL {
  typealias ID = String

  typealias SelectionSet = GraphQL_SelectionSet

  typealias InlineFragment = GraphQL_InlineFragment

  typealias MutableSelectionSet = GraphQL_MutableSelectionSet

  typealias MutableInlineFragment = GraphQL_MutableInlineFragment

  enum SchemaMetadata: ApolloAPI.SchemaMetadata {
    public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

    public static func objectType(forTypename typename: String) -> Object? {
      switch typename {
      case "Root": return GraphQL.Objects.Root
      case "FilmsConnection": return GraphQL.Objects.FilmsConnection
      case "Film": return GraphQL.Objects.Film
      case "Person": return GraphQL.Objects.Person
      case "Planet": return GraphQL.Objects.Planet
      case "Species": return GraphQL.Objects.Species
      case "Starship": return GraphQL.Objects.Starship
      case "Vehicle": return GraphQL.Objects.Vehicle
      case "FilmCharactersConnection": return GraphQL.Objects.FilmCharactersConnection
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}
// swiftlint:enable all
