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
    @IBOutlet weak var typeImageView: TypeIconUIImageView!
    func config(with model: Move) {
        DispatchQueue.main.async {
            self.typeImageView.image = model.type.icon
            self.typeImageView.backgroundColor = model.type.color
            self.nameLabel.text = model.name.capitalized
        }
    }
}

