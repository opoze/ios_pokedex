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
        DispatchQueue.main.async {
            // Carregar imagem
            self.pictureImageView.loadImage(from: model.image)
            self.nameLabel.text = model.name.capitalized
            self.idLabel.text = model.formattedId
            self.primaryTypeImageView.image = model.types.first?.icon
            self.primaryTypeImageView.backgroundColor = model.types.first?.color
            
            if model.types.count > 1  {
                self.secondaryTypeImageView.image = model.types[1].icon
                self.secondaryTypeImageView.backgroundColor = model.types[1].color
                self.secondaryTypeImageView.isHidden = false
            }
            else {
                self.secondaryTypeImageView.isHidden = true
            }
        }
    }
    
}
