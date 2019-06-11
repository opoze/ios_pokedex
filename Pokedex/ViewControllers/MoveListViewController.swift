//
//  MoveListViewController.swift
//  Pokedex
//
//  Created by Luis Alberto Zagonel Pozenato on 10/06/2019.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class MoveListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let requestMaker = RequestMaker()

    var moveList = [Move]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configTable()
        self.fetchData()
    }
    
    private func configTable(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

}

extension MoveListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.moveList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "move", for: indexPath)
        if let moveCell = cell as? MoveTableViewCell {
            moveCell.config(with: self.moveList[indexPath.row])
        }
        return cell
    }
}

extension MoveListViewController: UITableViewDelegate {
}


typealias  MoveListViewModel = MoveListViewController
extension MoveListViewModel {
    func fetchData() {
        requestMaker.make(withEndpoint: .move) { (moves: [Move]) in
            self.moveList = moves
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
