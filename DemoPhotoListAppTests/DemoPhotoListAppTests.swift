//
//  DemoPhotoListAppTests.swift
//  DemoPhotoListAppTests
//
//  Created by Moumita Bhattacharjee on 09/07/25.
//

import Testing
import XCTest

@testable import DemoPhotoListApp



final class APIServiceMock: APIServiceProtocol {
    var shouldFail = false
    var items: [Item] = []
    func fetchItems(completion: @escaping (Result<[Item], Error>) -> Void) {
        if shouldFail {
            completion(.failure(APIServiceError.noData))
        } else {
            completion(.success(items))
        }
    }
}

final class ItemListViewModelTests: XCTestCase {
    func testFetchItemsSuccess() {
        let mock = APIServiceMock()
        let item = Item(id: "bslo", name: "British Longhair", url: "https://cdn2.thecatapi.com/images/7isAO4Cav.jpg", temperament: "Affectionate", breedExplaination: "The British Longhair is a very laid-back relaxed cat, often perceived to be very independent although they will enjoy the company of an equally relaxed and likeminded cat. They are an affectionate breed, but very much on their own terms and tend to prefer to choose to come and sit with their owners rather than being picked up.", energyLevel: 3, isHairless: 1)
        mock.items = [item]
        let vm = ItemListViewModel(service: mock)
        let exp = expectation(description: "Fetch")
        vm.fetchItems()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertEqual(vm.items, [item])
            XCTAssertNil(vm.errorMessage)
            exp.fulfill()
        }
        waitForExpectations(timeout: 1)
    }

    func testFetchItemsFailure() {
        let mock = APIServiceMock()
        mock.shouldFail = true
        let vm = ItemListViewModel(service: mock)
        let exp = expectation(description: "Fetch")
        vm.fetchItems()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertEqual(vm.items.count, 0)
            XCTAssertNotNil(vm.errorMessage)
            exp.fulfill()
        }
        waitForExpectations(timeout: 1)
    }
}

final class ItemDetailViewModelTests: XCTestCase {
    func testDetailViewModel() {
        let item = Item(id: "bslo", name: "British Longhair", url: "https://cdn2.thecatapi.com/images/7isAO4Cav.jpg", temperament: "Affectionate", breedExplaination: "The British Longhair is a very laid-back relaxed cat, often perceived to be very independent although they will enjoy the company of an equally relaxed and likeminded cat. They are an affectionate breed, but very much on their own terms and tend to prefer to choose to come and sit with their owners rather than being picked up.", energyLevel: 3, isHairless: 1)
        let vm = ItemDetailViewModel(item: item)
        XCTAssertEqual(vm.item, item)
    }
}
