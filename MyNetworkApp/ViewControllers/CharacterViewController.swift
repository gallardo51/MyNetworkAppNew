//
//  CharacterViewController.swift
//  MyNetworkApp
//
//  Created by Александр Соболев on 20.03.2024.
//

import UIKit

class CharacterViewController: UITableViewController {
    
    var characters: WebsiteDescription!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        
    }
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters?.data?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! CharacterCell
        guard let character = characters?.data?[indexPath.row] else { return cell }
        
        cell.configure(with: character)
        return cell
    }
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsVC = segue.destination as? CharacterInfoViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let character = characters?.data?[indexPath.row]
        detailsVC.character = character
    }
}

