//
//  CategoriesRepository.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 30/03/2023.
//

import Foundation

protocol CategoriesRepository {
  var categories: [ModelCategory]? { get }
  func getCategories(completion: @escaping (Result<[ModelCategory], Error>) -> Void)
}
