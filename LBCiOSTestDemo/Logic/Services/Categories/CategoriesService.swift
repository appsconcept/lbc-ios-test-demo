//
//  CategoriesService.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 30/03/2023.
//

import Foundation

protocol CategoriesService {
  func getCategories(completion: @escaping (Result<[CategoryDTO], Error>) -> Void)
}
