//
//  ViewController.swift
//  Pokedex
//
//  Created by Juliano Nardon on 07/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class PokemonListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let requestMaker = RequestMaker()
    
    var pokemonList = [Pokemon]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configTable()
        fetchData()
        // Do any additional setup after loading the view.
    }
    
    private func configTable(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
}

extension PokemonListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pokemonList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokemon", for: indexPath)
        
        if let pokemonCell = cell as? PokemonTableViewCell {
            pokemonCell.config(with: self.pokemonList[indexPath.row])
        }
        
        return cell
    }
}

extension PokemonListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Esta é a segunda maneira de usar um navigator. Sem usar um "segue:
        // Não esquecer de setar o storyboard id no storyboard
        
        let storyBoard = self.storyboard
        if let detailViewController = storyBoard?.instantiateViewController(withIdentifier: "DetailViewController"){
            // Present é um modal
            self.navigationController?.present(detailViewController, animated: true)
        }
    }
}

// TODO: criar ViewModel de verdade
typealias  PokemonListViewModel = PokemonListViewController
extension PokemonListViewModel {
    func fetchData() {
        
//        requestMaker.make(withEndpoint: .details(query: "2")) { (pokemon: Pokemon) in
//            print(pokemon)
//        }
        
        requestMaker.make(withEndpoint: .list) { (pokemonList: PokemonList) in
//            print(pokemonList)
            self.pokemonList = pokemonList.pokemons
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        

    }
}
