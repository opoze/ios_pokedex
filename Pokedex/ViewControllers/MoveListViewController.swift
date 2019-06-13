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
    @IBOutlet weak var activityIndicatorView: UIView!
    
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Esta é a segunda maneira de usar um navigator. Sem usar um "segue:
        // Não esquecer de setar o storyboard id no storyboard
        let storyBoard = self.storyboard
        if let moveDetailViewController = storyBoard?.instantiateViewController(withIdentifier: "MoveDetailViewController"){
            // Present é um modal
            self.navigationController?.present(moveDetailViewController, animated: true)
        }
    }
}


typealias  MoveListViewModel = MoveListViewController
extension MoveListViewModel {
    func fetchData() {
        requestMaker.make(withEndpoint: .move) { (moves: [Move]) in
            self.moveList = moves
            DispatchQueue.main.async {
                self.activityIndicatorView.isHidden = true
                self.tableView.reloadData()
            }
        }
    }
}
