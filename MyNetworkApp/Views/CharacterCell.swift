//
//  CharacterCell.swift
//  MyNetworkApp
//
//  Created by Александр Соболев on 20.03.2024.
//

import UIKit

class CharacterCell: UITableViewCell {
    @IBOutlet weak var characterImageView: UIImageView! {
        didSet {
            characterImageView.contentMode = .scaleAspectFill
            characterImageView.clipsToBounds = true
            characterImageView.layer.cornerRadius = characterImageView.frame.height / 2
            characterImageView.backgroundColor = .gray
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    @IBOutlet weak var updatedLabel: UILabel!
    
    func configure(with character: Character) {
        nameLabel.text = character.name
        createdLabel.text = character.createdAt
        updatedLabel.text = character.updatedAt
        DispatchQueue.global().async {
            guard let url = URL(string: character.imageUrl ?? "") else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.characterImageView.image = UIImage(data: imageData)
            }
        }
    }
}
