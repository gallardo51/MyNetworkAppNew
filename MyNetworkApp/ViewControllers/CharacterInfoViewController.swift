//
//  CharacterInfoViewController.swift
//  MyNetworkApp
//
//  Created by Александр Соболев on 22.03.2024.
//

import UIKit

class CharacterInfoViewController: UIViewController {
    
    var character: Character!
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = character.name
        urlLabel.text = character.sourceUrl
        DispatchQueue.global().async {
            guard let imageData = ImageManager.shared.fetchImage(from: self.character.imageUrl) else { return }
            DispatchQueue.main.async {
                self.characterImage.image = UIImage(data: imageData)
            }
        }
    }
}
