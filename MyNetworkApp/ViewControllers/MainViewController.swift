//
//  MainViewController.swift
//  MyNetworkApp
//
//  Created by Александр Соболев on 20.03.2024.
//

import UIKit

enum UserActions: String, CaseIterable {
    case downloadImage = "Download Image"
    case characters = "Characters"
}

class MainViewController: UICollectionViewController {
    
    private var characters: WebsiteDescription?
    
    let userActions = UserActions.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchCharacter(from: Link.charactersURL.rawValue)
    }
    
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        userActions.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionCell
        
        cell.userActionLabel.text = userActions[indexPath.item].rawValue
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userAction = userActions[indexPath.item]
        
        switch userAction {
        case .downloadImage: performSegue(withIdentifier: "showImage", sender: nil)
        case .characters: performSegue(withIdentifier: "showCharacters", sender: nil)
        }
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCharacters" {
            guard let charactersVC = segue.destination as? CharacterViewController else { return }
            charactersVC.characters = characters
        }
    }
    
    private func fetchCharacter(from url: String?) {
        NetworkManager.shared.fetchData(from: url) { characters in
            self.characters = characters
        }
    }
}
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 45, height: 100)
    }
}
