//
//  DemoPhotoListApp.swift
//  DemoPhotoListApp
//
//  Created by Moumita Bhattacharjee on 09/07/25.
//

import SwiftUI

@main
struct DemoPhotoListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ItemListViewModel(service: APIService()))
        }
    }
}
