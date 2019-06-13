//
//  MoveDetailViewController.swift
//  Pokedex
//
//  Created by Luis Alberto Zagonel Pozenato on 11/06/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class MoveDetailViewController: UIViewController {

    // Outlets
    @IBAction func backAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mainTypeView: UIView!
    @IBOutlet weak var mainTypeImage: UIImageView!
    @IBOutlet weak var secondTypeView: UIView!
    @IBOutlet weak var secondTypeImage: UIImageView!
    @IBOutlet weak var typeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configTable()
    }
    
    private func configTable(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

}

extension MoveDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "content", for: indexPath)
        
//        if let pokemonCell = cell as? PokemonTableViewCell {
//            pokemonCell.config(with: self.pokemonList[indexPath.row])
//        }
        
        return cell
    }

}

extension MoveDetailViewController: UITableViewDelegate {
    
}
