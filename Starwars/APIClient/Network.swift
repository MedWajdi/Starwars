//
//  Network.swift
//  Starwars
//
//  Created by Mohamed Brahem on 25/04/2023.
//

import Foundation
import Apollo

class Network {
    
    static let shared = Network()
    lazy var apolloClient = ApolloClient(url: URL(string: "https://swapi-graphql.netlify.app/.netlify/functions/index")!)

}

