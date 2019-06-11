//
//  Move.swift
//  Pokedex
//
//  Created by Luis Alberto Zagonel Pozenato on 10/06/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

struct Move: Codable {
    let name: String
    let type: PokemonType
    let learnLevel: Int
}
