//
//  PokemonTableViewCell.swift
//  Pokedex
//
//  Created by Luis Alberto Zagonel Pozenato on 08/06/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {

    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var pType: PokemonTypeView!
    @IBOutlet weak var sType: PokemonTypeView!
    
    func config(with model: Pokemon) {
        DispatchQueue.main.async {
            // Carregar imagem
            self.pictureImageView.loadImage(from: model.image)
            self.nameLabel.text = model.name.capitalized
            self.idLabel.text = model.formattedId
            
            if model.types.count >= 1 {
                self.pType.typeLabel.isHidden = true
                self.pType.config(type: model.types[0])
            }
            if model.types.count >= 2 {
                self.sType.typeLabel.isHidden = true
                self.sType.config(type: model.types[1])
            }
        }
    }
}
