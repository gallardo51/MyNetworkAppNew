//
//  Character.swift
//  MyNetworkApp
//
//  Created by Александр Соболев on 20.03.2024.
//
struct Course: Decodable {
    let id: Int?
    let name: String?
    let link: String?
    let imageUrl: String?
    let number_of_lessons: Int?
    let number_of_tests: Int?
}

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
    let createdAt: String?
    let updatedAt: String
}

enum Link: String {
    case imageURL = "https://img2.akspic.ru/attachments/crops/0/4/5/6/6/166540/166540-ios_15-yabloko-ios-ios_14-sklon-1080x1920.jpg"
    case charactersURL = "https://api.disneyapi.dev/character"
    case courses = "https://swiftbook.ru//wp-content/uploads/api/api_courses"
}
