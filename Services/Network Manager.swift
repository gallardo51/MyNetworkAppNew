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
    
    func fetchImage(from url: URL, completion: @escaping(Data, URLResponse) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let response = response else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            guard url == response.url else { return }
            DispatchQueue.main.async {
                completion(data, response)
            }
        }
    }
}
