//
//  CategoriesRouteProvider.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 30/03/2023.
//

import Foundation

protocol CategoriesRouteProvider {
  init (baseUrl: String)
  func getCategoriesRoute() -> URLRequest
}
