//
//  DetailViewController.swift
//  Pokedex
//
//  Created by Luis Alberto Zagonel Pozenato on 08/06/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var gradientView: GradientView!
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonImageViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var pokemonImageViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var pokemonImageViewCenterVerticallyConstraint: NSLayoutConstraint!
    @IBOutlet weak var pokemonImageViewTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var pokemonDetailView: PokemonDetailView!
    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var pokemon: Pokemon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.accessibilityIdentifier = "detailView"
        self.initialConfig()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.requestPokemon()
        self.loadPokemonAnimation()
    }

    func loadPokemonAnimation() {
        // Animation tipo 2 see * 1 on botton
        UIView.animate(withDuration: 1, delay: 0,  options: [.repeat , .autoreverse, .curveEaseInOut], animations: {
            self.pokemonImageView.alpha = 0.2
        })
    }
    
    func showDetailView() {
        if let pokemon = self.pokemon {
            self.pokemonDetailView.config(pokemon: pokemon)
            self.pokemonDetailView.isHidden = false
            UIView.animate(withDuration: 0.5, animations: {
                self.pokemonDetailView.alpha = 1.0
                self.pokemonDetailView.anime()
            })
        }
    }
    
    func animatePokomonToTop() {
        DispatchQueue.main.async {
            self.pokemonImageView.layer.removeAllAnimations()
            UIView.animate(withDuration: 0.5, delay: 0, animations: {
                self.pokemonImageView.alpha = 1
                self.pokemonImageViewCenterVerticallyConstraint.priority = UILayoutPriority(rawValue: 900)
                self.pokemonImageViewTopConstraint.priority = UILayoutPriority(rawValue: 999)
                self.pokemonImageViewWidthConstraint.constant = 80
                self.pokemonImageViewHeightConstraint.constant = 80
                // layout asincrono
                self.view.layoutIfNeeded()
            }, completion: { (ok: Bool) in
                self.showDetailView()
            })
        }
    }
    
    func requestPokemon() {
        if let pokemon = self.pokemon {
            let requestMaker = RequestMaker()
            requestMaker.make(withEndpoint: .details(query: pokemon.id)) { (pokemon: Pokemon) in
                self.pokemon = pokemon
                self.animatePokomonToTop()
            }
        }
    }
    
    func initialConfig() {
        self.pokemonDetailView.isHidden = true
        self.pokemonDetailView.alpha = 0.0
        self.pokemonDetailView.resetGauges()
        if let pokemon = self.pokemon {
            self.gradientView.startColor = pokemon.types.first?.color ?? .black
            self.gradientView.endColor = pokemon.types.first?.color?.lighter() ?? .white
            self.pokemonImageView.loadImage(from: pokemon.image)
        }
    }
}


/*
 Animation tipo 1
 UIView.animate(withDuration: 1, animations: {
    self.imageView.alpha = self.imageView.alpha == 1 ? 0.2 : 1
 }) { _ in
    self.loadPokemonAnimation()
 }
 */
