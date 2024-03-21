//
//  Character.swift
//  MyNetworkApp
//
//  Created by Александр Соболев on 20.03.2024.
//

struct WebsiteDescription: Decodable {
    let info: Info
    let data: [Character]?
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
