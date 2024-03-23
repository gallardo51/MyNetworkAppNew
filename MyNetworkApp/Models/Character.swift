//
//  Character.swift
//  MyNetworkApp
//
//  Created by Александр Соболев on 20.03.2024.
//

struct WebsiteDescription: Decodable {
    let info: Info
    let data: [Character]?
    
    init(value: [String: Any]) {
        
        let info = value["info"] as? [String: Any] ?? [:]
        let infoDictValue = Info(count: info["count"] as? Int,
                                 totalPages: info["totalPages"] as? Int,
                                 previousPage: info["previousPage"] as? String,
                                 nextPage: info["nextPage"] as? String
        )
        
        let data = value["data"] as? [String: Any] ?? [:]
        let dataDictValue = [Character(_id: data["_id"] as? Int,
                                       films: data["films"] as? [String],
                                       shortFilms: data["shortFilms"] as? [String],
                                       tvShows: data["tvShows"] as? [String],
                                       videoGames: data["videoGames"] as? [String],
                                       parkAttractions: data["parkAttractions"] as? [String],
                                       allies: data["allies"] as? [String],
                                       enemies: data["enemies"] as? [String],
                                       sourceUrl: data["sourceUrl"] as? String,
                                       name: data["sname"] as? String,
                                       imageUrl: data["imageUrl"] as? String,
                                       createdAt: data["createdAt"] as? String,
                                       updatedAt: data["updatedAt"] as? String,
                                       url: data["url"] as? String,
                                       __v: data["__v"] as? Int
                                      )]
        
        self.info = infoDictValue
        self.data = dataDictValue
        
    }
    
    static func getCharacter(from value: Any) -> [WebsiteDescription]? {
        guard let arrayOfCharacters = value as? [[String: Any]] else { return nil }
        return arrayOfCharacters.compactMap { WebsiteDescription(value: $0)
        }
    }
}

struct Info: Decodable {
    let count: Int?
    let totalPages: Int?
    let previousPage: String?
    let nextPage: String?
}

struct Character: Decodable {
    let _id: Int?
    let films: [String]?
    let shortFilms: [String]?
    let tvShows: [String]?
    let videoGames: [String]?
    let parkAttractions: [String]?
    let allies: [String]?
    let enemies: [String]?
    let sourceUrl: String?
    let name: String?
    let imageUrl: String?
    let createdAt: String?
    let updatedAt: String?
    let url: String?
    let __v: Int?
}

enum Link: String {
    case imageURL = "https://img2.akspic.ru/attachments/crops/3/7/1/6/6/166173/166173-yabloko-ios-apple-iphone-ios_15-1080x1920.jpg"
    case charactersURL = "https://api.disneyapi.dev/character"
}
