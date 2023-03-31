//
//  MockAdsServiceRoutes.swift
//  LBCiOSTestDemoTests
//
//  Created by Marco Appsconcept on 31/03/2023.
//

import Foundation
@testable import LBCiOSTestDemo

class MockAdsServiceRoutes: AdsRouteProvider {
  required init(baseUrl: String) {}

  func getAdsRoute() -> URLRequest {
    return URLRequest(url: URL(fileURLWithPath: "listing"))
  }
}
