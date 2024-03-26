//
//  CharacterImageView.swift
//  MyNetworkApp
//
//  Created by Александр Соболев on 26.03.2024.
//

import UIKit

class CharacterImageView: UIImageView {
    func fetchImage(from url: String) {
        guard let url = URL(string: url) else {
            image = UIImage(named: "image")
            return
        }
        
    }
}
