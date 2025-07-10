//
//  APIServiceProtocol.swift
//  DemoPhotoListApp
//
//  Created by Moumita Bhattacharjee on 09/07/25.
//

import Foundation

public protocol APIServiceProtocol {
    func fetchItems(completion: @escaping (Result<[Item], Error>) -> Void)
}
