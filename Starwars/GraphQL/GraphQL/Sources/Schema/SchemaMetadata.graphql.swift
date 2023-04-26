// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public typealias ID = String

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == GraphQL.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == GraphQL.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == GraphQL.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == GraphQL.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
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
    case "FilmSpeciesConnection": return GraphQL.Objects.FilmSpeciesConnection
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
