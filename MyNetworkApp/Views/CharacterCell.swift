//
//  CharacterCell.swift
//  MyNetworkApp
//
//  Created by Александр Соболев on 20.03.2024.
//

import UIKit

class CharacterCell: UITableViewCell {
    @IBOutlet weak var characterImageView: CharacterImageView! {
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
        characterImageView.fetchImage(from: character.imageUrl ?? "")
    }
}
