//
//  BrawlerList.swift
//  Brawl Stars Wiki
//
//  Created by admin on 04/03/24.
//

import Foundation


// MARK: - Welcome
struct BrawlerList: Codable {
    let brawler: [Brawler]
}

// MARK: - Brawler
struct Brawler: Codable {
    let name, rarity, brawlerClass: String?
    let iconBrawl: String?
    let descriptionBrawler: String
//    let attack: Attack
//    let brawlerSuper: Super
//    let gadgets: Gadgets
//    let starPower: StarPower
//    let hypercharge: Hypercharge

//    enum CodingKeys: String, CodingKey {
//        case name, rarity
//        case brawlerClass = "class"
//        case iconBrawl, descriptionBrawler
//        case attack = "Attack"
//        case brawlerSuper = "super"
//        case gadgets = "Gadgets"
//        case starPower = "Star Power"
//        case hypercharge = "Hypercharge"
//    }
}

// MARK: - Attack
//struct Attack: Codable {
//    let name, descriptionGame, descriptionWiki: String
//    let image: String
//}
//
//// MARK: - Super
//struct Super: Codable {
//    let name, descriptiongame, descriptionWiki: String
//    let image: String
//}
//
//// MARK: - Super
//struct Gadgets: Codable {
//    let name, descriptiongame, descriptionWiki: String
//    let image: String
//}
//
//// MARK: - Super
//struct StarPower: Codable {
//    let name, descriptiongame, descriptionWiki: String
//    let image: String
//}
//
//// MARK: - Hypercharge
//struct Hypercharge: Codable {
//    let name, descriptiongame, descriptionwiki: String
//    let image: String
//}
