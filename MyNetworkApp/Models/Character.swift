//
//  Character.swift
//  MyNetworkApp
//
//  Created by Александр Соболев on 20.03.2024.
//

struct Character: Decodable {
    let films: [String]?
    let shortFilms: [String]?
    let tvShows: [String]?
    let videoGames: [String]?
    let parkAttractions: [String]?
    let allies: [String]?
    let enemies: [String]?
    let sourceURL: String?
    let name: String?
    let imageURL: String?
    let url: String?
}

struct WebsiteDescription: Decodable {
    let count: Int?
    let totalPages: Int?
    let nextPage: String?
}

enum Link: String {
    case imageURL = "https://img2.akspic.ru/attachments/crops/0/4/5/6/6/166540/166540-ios_15-yabloko-ios-ios_14-sklon-1080x1920.jpg"
    case charactersURL = "https://api.disneyapi.dev/character"
}
