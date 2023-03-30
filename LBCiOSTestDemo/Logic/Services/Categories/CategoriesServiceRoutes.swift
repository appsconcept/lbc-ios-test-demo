//
//  CategoriesServiceRoutes.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 30/03/2023.
//

import Foundation

class CategoriesServiceRoutes: CategoriesRouteProvider {
  private let baseUrl: URL

  required init(baseUrl: String) {
    if let baseUrl = URL(string: baseUrl) {
      self.baseUrl = baseUrl
    } else {
      fatalError("Malformed baseUrl: \(baseUrl)")
    }
  }

  func getCategoriesRoute() -> URLRequest {
    var request = URLRequest(url: baseUrl.appendingPathComponent("categories.json"))
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    return request
  }
}
