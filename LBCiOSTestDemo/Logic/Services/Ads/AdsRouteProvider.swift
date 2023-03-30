//
//  AdsRouteProvider.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 29/03/2023.
//

import Foundation

protocol AdsRouteProvider {
  init (baseUrl: String)
  func getAdsRoute() -> URLRequest
}
