//
//  MockCategoriesServiceRoutes.swift
//  LBCiOSTestDemoTests
//
//  Created by Marco Appsconcept on 31/03/2023.
//

import Foundation
@testable import LBCiOSTestDemo

class MockCategoriesServiceRoutes: CategoriesRouteProvider {
  required init(baseUrl: String) {}

  func getCategoriesRoute() -> URLRequest {
    return URLRequest(url: URL(fileURLWithPath: "categories"))
  }
}
