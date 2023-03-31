//
//  AdsServiceTests.swift
//  LBCiOSTestDemoTests
//
//  Created by Marco Appsconcept on 31/03/2023.
//

import Foundation
@testable import LBCiOSTestDemo
import XCTest

class AdsServiceTests: XCTestCase {
  func testAdsServiceAdsRetrieval() {
    // GIVEN
    let service = MockAdsService(routeProvider: MockAdsServiceRoutes(baseUrl: ""), dataLoader: MockDataLoaderService())

    // WHEN
    let result: Result<[ClassifiedAdDTO], Error> = awaitCompletion { completion in
      service.getAds(completion: completion)
    }

    // THEN
    switch result {
    case .success(let ads):
      XCTAssertTrue(ads.count == 300)
    case .failure(_):
      XCTFail()
    }
  }

  func testAdsServiceAdsDataStructure() {
    // GIVEN
    let service = MockAdsService(routeProvider: MockAdsServiceRoutes(baseUrl: ""), dataLoader: MockDataLoaderService())

    // WHEN
    let result: Result<[ClassifiedAdDTO], Error> = awaitCompletion { completion in
      service.getAds(completion: completion)
    }

    // THEN
    switch result {
    case .success(let ads):
      let ad = ads.first
      XCTAssertEqual(ad?.id, 1461267313)
      XCTAssertEqual(ad?.categoryId, 4)
      XCTAssertEqual(ad?.title, "Statue homme noir assis en plâtre polychrome")
      XCTAssertEqual(ad?.description, "Magnifique Statuette homme noir assis fumant le cigare en terre cuite et plâtre polychrome réalisée à la main.  Poids  1,900 kg en très bon état, aucun éclat  !  Hauteur 18 cm  Largeur : 16 cm Profondeur : 18cm  Création Jacky SAMSON  OPTIMUM  PARIS  Possibilité de remise sur place en gare de Fontainebleau ou Paris gare de Lyon, en espèces (heure et jour du rendez-vous au choix). Envoi possible ! Si cet article est toujours visible sur le site c'est qu'il est encore disponible")
      XCTAssertEqual(ad?.price, 140.00)
      XCTAssertEqual(ad?.imagesUrl.small, "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-small/2c9563bbe85f12a5dcaeb2c40989182463270404.jpg")
      XCTAssertEqual(ad?.imagesUrl.thumb, "https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/2c9563bbe85f12a5dcaeb2c40989182463270404.jpg")
      XCTAssertEqual(ad?.creationDate, "2019-11-05T15:56:59+0000")
      XCTAssertEqual(ad?.isUrgent, false)

    case .failure(_):
      XCTFail()
    }
  }
}
