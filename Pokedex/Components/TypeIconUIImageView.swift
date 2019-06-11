//
//  PokemonTypeIcon.swift
//  Pokedex
//
//  Created by Luis Alberto Zagonel Pozenato on 08/06/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class TypeIconUIImageView: UIImageView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addShadow()
    }
    
}
