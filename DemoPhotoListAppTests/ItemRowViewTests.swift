//
//  ItemRowViewTests.swift
//  DemoPhotoListApp
//
//  Created by Moumita Bhattacharjee on 09/07/25.
//

import XCTest
import SwiftUI
@testable import DemoPhotoListApp

final class ItemRowViewSnapshotTests: XCTestCase {
    func testItemRowView() {
        let item = Item(id: "bslo", name: "British Longhair", url: "https://cdn2.thecatapi.com/images/7isAO4Cav.jpg", temperament: "Affectionate", breedExplaination: "The British Longhair is a very laid-back relaxed cat, often perceived to be very independent although they will enjoy the company of an equally relaxed and likeminded cat. They are an affectionate breed, but very much on their own terms and tend to prefer to choose to come and sit with their owners rather than being picked up.", energyLevel: 3, isHairless: 1)
        let row = ItemRowView(item: item)
        XCTAssertNotNil(row.body)
    }
}
