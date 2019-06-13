//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Luis Alberto Zagonel Pozenato on 12/06/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

import UIKit

class PokemonDetailView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var pokemonTypeView: PokemonTypeView!
    @IBOutlet weak var secPokemonTypeView: PokemonTypeView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var hp: StateGaugeView!
    @IBOutlet weak var atk: StateGaugeView!
    @IBOutlet weak var def: StateGaugeView!
    @IBOutlet weak var satk: StateGaugeView!
    @IBOutlet weak var sdef: StateGaugeView!
    @IBOutlet weak var spd: StateGaugeView!
    
    let nibName = "PokemonDetailView"
    
    var pokemon: Pokemon?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        contentView.fixInView(self)
    }
    
    func config(pokemon: Pokemon) {
        
        // Config pokemonTypeView
        self.pokemon = pokemon
        
        if let pokemonTypes = self.pokemon?.types {
            if pokemonTypes.count >= 1 {
                self.pokemonTypeView.config(type: pokemonTypes[0])
            }
            if pokemonTypes.count >= 2 {
                self.secPokemonTypeView.isHidden = false
                self.secPokemonTypeView.config(type: pokemonTypes[1])
            }
        }
        
        self.nameLabel.text = pokemon.name.capitalized
        //@TODO:luis.pozenato: mudar n de linhas do label em runtime
        self.descriptionLabel.text = pokemon.description

        
        // Config Gauges
        if let stats = self.pokemon?.stats {
            stats.forEach { (stat) in
                let name: String = stat.name.uppercased()
                let value: Int = Int(stat.value)
                switch name {
                case "SPEED":
                    self.spd.config(name: "SPD", stat: value)
                case "SPECIAL-DEFENSE":
                    self.sdef.config(name: "SDEF", stat: value)
                case "SPECIAL-ATTACK":
                    self.satk.config(name: "SATK", stat: value)
                case "DEFENSE":
                    self.def.config(name: "DEF", stat: value)
                case "ATTACK":
                    self.atk.config(name: "ATK", stat: value)
                case "HP":
                    self.hp.config(name: "HP", stat: value)
                default:
                    return
                }
            }
        }
        
    }
    
    func resetGauges() {
        self.spd.config(name: "SPD", stat: 0)
        self.sdef.config(name: "SDEF", stat: 0)
        self.satk.config(name: "SATK", stat: 0)
        self.atk.config(name: "ATK", stat: 0)
        self.def.config(name: "DEF", stat: 0)
        self.hp.config(name: "HP", stat: 0)
        self.anime()
    }
    
    func anime() {
        self.hp.animate()
        self.sdef.animate()
        self.satk.animate()
        self.def.animate()
        self.spd.animate()
        self.atk.animate()
    }
    
}
