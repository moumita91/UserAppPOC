//
//  ItemDetailView.swift
//  DemoPhotoListApp
//
//  Created by Moumita Bhattacharjee on 09/07/25.
//

import SwiftUI

struct ItemDetailView: View {
    @ObservedObject var viewModel: ItemDetailViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: URL(string: viewModel.item.url)) { phase in
                    if let image = phase.image {
                        image.resizable().aspectRatio(contentMode: .fit)
                    } else if phase.error != nil {
                        Color.red.frame(height: 200)
                            .overlay(Text("Image not available").foregroundColor(.white))
                    } else {
                        ProgressView().frame(height: 200)
                    }
                }
                Text(viewModel.item.name)
                    .font(.largeTitle)
                    .bold()
                Text(viewModel.item.temperament)
                    .font(.footnote)
                Text(viewModel.item.breedExplaination)
                    .font(.body)
                if (viewModel.item.isHairless != 0) {
                    Text("hairless")
                }
                HStack {
                    Text("Energy level")
                    Spacer()
                    ForEach(1..<6) { id in
                        Image(systemName: "star.fill")
                            .foregroundColor(viewModel.item.energyLevel > id ? Color.accentColor : Color.gray )
                    }
                }
                
                Spacer()
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)

        }
    }
}
