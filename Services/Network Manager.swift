//
//  Network Manager.swift
//  MyNetworkApp
//
//  Created by Александр Соболев on 22.03.2024.
//

import Foundation
import Alamofire

enum NetworkError {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(_ completion: @escaping([WebsiteDescription]) -> Void) {
        AF.request(Link.charactersURL.rawValue)
            .validate()
            .responseJSON { dataResponse in
            switch dataResponse.result {
            case .success(let value):
                guard let results = WebsiteDescription.getCharacter(from: value) else { return }
                DispatchQueue.main.async {
                    completion(results)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
    
//    func fetchData(from url: String?, with completion: @escaping(WebsiteDescription) -> Void) {
//        guard let stringURL = url else { return }
//        guard let url = URL(string: stringURL) else { return }
//        
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data else {
//                print(error?.localizedDescription ?? "No error description")
//                return
//            }
//            
//            do {
//                let characters = try JSONDecoder().decode(WebsiteDescription.self, from: data)
//                DispatchQueue.main.async {
//                   completion(characters)
//                }
//            } catch let error {
//                print(error)
//            }
//        }.resume()
//    }
//}
//
//class ImageManager {
//    static var shared = ImageManager()
//    
//    private init() {}
//    
//    func fetchImage(from url: String?) -> Data? {
//        guard let stringURL = url else { return nil }
//        guard let imageURL = URL(string: stringURL) else { return nil }
//        return try? Data(contentsOf: imageURL)
//    }
//}
