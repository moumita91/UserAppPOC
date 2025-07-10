//
//  APIService.swift
//  DemoPhotoListApp
//
//  Created by Moumita Bhattacharjee on 09/07/25.
//

import Foundation

public final class APIService: APIServiceProtocol {
    private let urlString = "https://api.myjson.online/v1/records/5e549431-9205-4add-b18d-085ea6831f2f"
    
    public func fetchItems(completion: @escaping (Result<[Item], Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(APIServiceError.invalidURL))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(APIServiceError.noData))
                return
            }
            do {
                let items = try JSONDecoder().decode(RootResponse.self, from: data)
                let catLists = items.data
                completion(.success(catLists))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

enum APIServiceError: Error {
    case invalidURL
    case noData
}
