//
//  item.swift
//  DemoPhotoListApp
//
//  Created by Moumita Bhattacharjee on 09/07/25.
//

import Foundation

public struct Item: Codable, Identifiable, Equatable {
    
    public let id: String
    public let name: String
    public let url: String
    public let temperament: String
    public let breedExplaination: String
    public let energyLevel: Int
    public let isHairless: Int

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case url
        case temperament
        case breedExplaination = "description"
        case energyLevel = "energy_level"
        case isHairless = "hairless"
    }
}
