//
//  MovieTableViewCell.swift
//  Pokedex
//
//  Created by Luis Alberto Zagonel Pozenato on 10/06/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class MoveTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var type: PokemonTypeView!
    func config(with model: Move) {
        DispatchQueue.main.async {
            self.type.config(type: model.type)
            self.type.typeLabel.isHidden = true
            self.type.addShadow()
            self.nameLabel.text = model.name.capitalized
        }
    }
}

