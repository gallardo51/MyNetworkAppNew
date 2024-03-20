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

let link = "https://api.disneyapi.dev/character"
