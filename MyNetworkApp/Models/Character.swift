//
//  Character.swift
//  MyNetworkApp
//
//  Created by Александр Соболев on 20.03.2024.
//

struct WebsiteDescription: Decodable {
    let info: Info?
    let data: [Character]?
    
    init(value: [String: Any]) {
        let infoDict = value["info"] as? [String: Any] ?? [:]
        let info = Info(count: infoDict["count"] as? Int,
                        totalPages:  infoDict["totalPages"] as? Int,
                        previousPage:  infoDict["previousPage"] as? String,
                        nextPage:  infoDict["nextPage"] as? String
        )
        let dataDict = value["data"] as? [[String: Any]] ?? [[:]]
        let data = Character.getHero(from: dataDict)
        
        self.info = info
        self.data = data
    }
    
    static func  getCharacters(from value: Any) -> WebsiteDescription? {
        guard let value = value as? [String: Any] else { return nil }
        return WebsiteDescription(value: value)
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
    
    init(value: [String: Any]) {
        _id = value["_id"] as? Int
        films = value["films"] as? [String]
        shortFilms = value["shortFilms"] as? [String]
        tvShows = value["tvShows"] as? [String]
        videoGames = value["videoGames"] as? [String]
        parkAttractions = value["parkAttractions"] as? [String]
        allies = value["allies"] as? [String]
        enemies = value["enemies"] as? [String]
        sourceUrl = value["sourceUrl"] as? String
        name = value["name"] as? String
        imageUrl = value["imageUrl"] as? String
        createdAt = value["createdAt"] as? String
        updatedAt = value["updatedAt"] as? String
        url = value["url"] as? String
        __v = value["__v"] as? Int
    }
    
        static func getHero(from arrayOfItems: Any) -> [Character]? {
            guard let value = arrayOfItems as? [[String: Any]] else { return nil }
            return value.compactMap { Character(value: $0) }
        
    }
}

enum Link: String {
    case imageURL = "https://img2.akspic.ru/attachments/crops/3/7/1/6/6/166173/166173-yabloko-ios-apple-iphone-ios_15-1080x1920.jpg"
    case charactersURL = "https://api.disneyapi.dev/character"
}
