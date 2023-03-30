//
//  AdsServiceRoutes.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 29/03/2023.
//

import Foundation

class AdsServiceRoutes: AdsRouteProvider {
  private let baseUrl: URL

  required init(baseUrl: String) {
    if let baseUrl = URL(string: baseUrl) {
      self.baseUrl = baseUrl
    } else {
      fatalError("Malformed baseUrl: \(baseUrl)")
    }
  }

  func getAdsRoute() -> URLRequest {
    var request = URLRequest(url: baseUrl.appendingPathComponent("listing.json"))
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    return request
  }
}
