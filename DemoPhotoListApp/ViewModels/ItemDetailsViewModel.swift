//
//  ItemDetailsViewModel.swift
//  DemoPhotoListApp
//
//  Created by Moumita Bhattacharjee on 09/07/25.
//

import Foundation

public final class ItemDetailViewModel: ObservableObject {
    public let item: Item

    public init(item: Item) {
        self.item = item
    }
}
