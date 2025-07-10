//
//  ItemListViewModel.swift
//  DemoPhotoListApp
//
//  Created by Moumita Bhattacharjee on 09/07/25.
//

import Foundation

public final class ItemListViewModel: ObservableObject {
    @Published var items: [Item] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    private let service: APIServiceProtocol

    public init(service: APIServiceProtocol) {
        self.service = service
    }

    public func fetchItems() {
        isLoading = true
        errorMessage = nil
        service.fetchItems { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let items):
                    self?.items = items
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
