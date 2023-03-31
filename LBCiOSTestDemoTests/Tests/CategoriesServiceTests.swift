//
//  CategoriesServiceTests.swift
//  LBCiOSTestDemoTests
//
//  Created by Marco Appsconcept on 31/03/2023.
//

import Foundation
@testable import LBCiOSTestDemo
import XCTest

class CategoriesServiceTests: XCTestCase {
  func testCategoriesServiceCategoriesRetrieval() {
    // GIVEN
    let service = MockCategoriesService(routeProvider: MockCategoriesServiceRoutes(baseUrl: ""), dataLoader: MockDataLoaderService())

    // WHEN
    let result: Result<[CategoryDTO], Error> = awaitCompletion { completion in
      service.getCategories(completion: completion)
    }

    // THEN
    switch result {
    case .success(let categories):
      XCTAssertTrue(categories.count == 11)
    case .failure(_):
      XCTFail()
    }
  }

  func testCategoriesServiceCategoriesData() {
    // GIVEN
    let service = MockCategoriesService(routeProvider: MockCategoriesServiceRoutes(baseUrl: ""), dataLoader: MockDataLoaderService())

    // WHEN
    let result: Result<[CategoryDTO], Error> = awaitCompletion { completion in
      service.getCategories(completion: completion)
    }

    // THEN
    switch result {
    case .success(let categories):
      let categoryOne = categories[0]
      XCTAssertEqual(categoryOne.id, 1)
      XCTAssertEqual(categoryOne.name, "Véhicule")
      let categoryTwo = categories[1]
      XCTAssertEqual(categoryTwo.id, 2)
      XCTAssertEqual(categoryTwo.name, "Mode")
      let categoryThree = categories[2]
      XCTAssertEqual(categoryThree.id, 3)
      XCTAssertEqual(categoryThree.name, "Bricolage")
      let categoryFour = categories[3]
      XCTAssertEqual(categoryFour.id, 4)
      XCTAssertEqual(categoryFour.name, "Maison")
      let categoryFive = categories[4]
      XCTAssertEqual(categoryFive.id, 5)
      XCTAssertEqual(categoryFive.name, "Loisirs")
      let categorySix = categories[5]
      XCTAssertEqual(categorySix.id, 6)
      XCTAssertEqual(categorySix.name, "Immobilier")
      let categorySeven = categories[6]
      XCTAssertEqual(categorySeven.id, 7)
      XCTAssertEqual(categorySeven.name, "Livres/CD/DVD")
      let categoryEight = categories[7]
      XCTAssertEqual(categoryEight.id, 8)
      XCTAssertEqual(categoryEight.name, "Multimédia")
      let categoryNine = categories[8]
      XCTAssertEqual(categoryNine.id, 9)
      XCTAssertEqual(categoryNine.name, "Service")
      let categoryTen = categories[9]
      XCTAssertEqual(categoryTen.id, 10)
      XCTAssertEqual(categoryTen.name, "Animaux")
      let categoryEleven = categories[10]
      XCTAssertEqual(categoryEleven.id, 11)
      XCTAssertEqual(categoryEleven.name, "Enfants")
    case .failure(_):
      XCTFail()
    }
  }
}
