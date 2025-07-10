//
//  ContentView.swift
//  DemoPhotoListApp
//
//  Created by Moumita Bhattacharjee on 09/07/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ItemListViewModel

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let error = viewModel.errorMessage {
                    Text("Error: \(error)").foregroundColor(.red)
                } else {
                    List(viewModel.items) { item in
                        NavigationLink(destination: ItemDetailView(viewModel: ItemDetailViewModel(item: item))) {
                            ItemRowView(item: item)
                        }
                    }
                }
            }
            .navigationTitle("Cat Breed List")
            .onAppear {
                viewModel.fetchItems()
            }
        }
    }
}
