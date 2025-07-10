//
//  RootResponse.swift
//  DemoPhotoListApp
//
//  Created by Moumita Bhattacharjee on 09/07/25.
//

import Foundation


// MARK: - Main Response
public struct RootResponse: Codable {
    let data: [Item]
    let id: String
    let version: Int
}
