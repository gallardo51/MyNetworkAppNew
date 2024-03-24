//
//  Network Manager.swift
//  MyNetworkApp
//
//  Created by Александр Соболев on 22.03.2024.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(_ url: String, completion: @escaping(Result<WebsiteDescription, NetworkError>) -> Void) {
        AF.request(Link.charactersURL.rawValue)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    guard let results = WebsiteDescription.getCharacters(from: value) else { return }
                    DispatchQueue.main.async {
                        completion(.success(results))
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
}

class ImageManager {
    static var shared = ImageManager()
    
    private init() {}
    
    func fetchImage(from url: String?) -> Data? {
        guard let stringURL = url else { return nil }
        guard let imageURL = URL(string: stringURL) else { return nil }
        return try? Data(contentsOf: imageURL)
    }
}
