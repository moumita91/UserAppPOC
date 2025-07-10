//
//  ItemRowView.swift
//  DemoPhotoListApp
//
//  Created by Moumita Bhattacharjee on 09/07/25.
//

import SwiftUI

struct ItemRowView: View {
    let item: Item

    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: URL(string: item.url)) { phase in
                if let image = phase.image {
                    image.resizable().aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                } else if phase.error != nil {
                    Color.red.frame(width: 60, height: 60)
                        .overlay(Text("X").foregroundColor(.white))
                } else {
                    ProgressView().frame(width: 60, height: 60)
                }
            }
            VStack(alignment: .leading, spacing: 4) {
                Text(item.name)
                    .font(.headline)
                Text(item.breedExplaination)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
        }
    }
}
