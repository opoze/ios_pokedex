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
    @IBOutlet weak var primaryTypeImageView: TypeIconUIImageView!
    @IBOutlet weak var secondaryTypeImageView: TypeIconUIImageView!
    
    func config(with model: Pokemon) {
        // Carregar imagem
        pictureImageView.loadImage(from: model.image)
        nameLabel.text = model.name.capitalized
        idLabel.text = model.formattedId
        primaryTypeImageView.image = model.types.first?.icon
        primaryTypeImageView.backgroundColor = model.types.first?.color
        
        if model.types.count > 1  {
            secondaryTypeImageView.image = model.types[1].icon
            secondaryTypeImageView.backgroundColor = model.types[1].color
            secondaryTypeImageView.isHidden = false
        }
        else {
            secondaryTypeImageView.isHidden = true
        }
    }
    
}
