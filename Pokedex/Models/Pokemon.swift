//
//  Pokemon.swift
//  Pokedex
//
//  Created by Luis Alberto Zagonel Pozenato on 08/06/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

// Can use quicktype.io para gerar as structs
struct PokemonList: Codable {
    var pokemons: [Pokemon]
}

struct Pokemon: Codable {
    let id: String
    let name: String
    let image: String
    let types: [PokemonType]
    var formattedId: String {
        return String.init(format: "#%03d", Int(self.id) ?? 0)
    }
}

//extension Pokemon.Type: CustomStringConvertible {
//    var description: String {
//        return self.rawValue.capitalized
//    }
//}
//
//extension Pokemon: CustomStringConvertible {
//    var description: String {
//        return "Pokemon: \(self.name.capitalized), com tipos: \(self.types)\n"
//    }
//}


