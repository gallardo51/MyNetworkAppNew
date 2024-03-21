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
    case imageURL = "https://img3.akspic.ru/attachments/crops/6/8/0/6/6/166086/166086-ios_15_official_stock_wallpaper_original_quality_wwdc21_light-1440x2560.jpg"
    case charactersURL = "https://api.disneyapi.dev/character"
}
