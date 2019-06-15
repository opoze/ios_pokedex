//
//  Pokemon.swift
//  Pokedex
//
//  Created by Luis Alberto Zagonel Pozenato on 08/06/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

struct PokemonResponse: Codable {
    let list: PokemonList
}

// Can use quicktype.io para gerar as structs
struct PokemonList: Codable {
    var pokemons: [Pokemon]
}

struct Stats: Codable {
    let value: Int
    let name: String
}

struct Pokemon: Codable {
    let id: String
    let name: String
    let image: String
    let types: [PokemonType]
    var formattedId: String {
        return String.init(format: "#%03d", Int(self.id) ?? 0)
    }
    let description: String?
    let stats: [Stats]?
}
