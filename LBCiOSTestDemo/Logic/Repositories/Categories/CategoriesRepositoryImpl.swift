//
//  CategoriesRepositoryImpl.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 30/03/2023.
//

import Foundation

class CategoriesRepositoryImpl: CategoriesRepository {
  let service: CategoriesService
  var categories: [ModelCategory]? = nil

  init(service: CategoriesService) {
    self.service = service
  }

  // Retrieve cached categories. The first time retrieve them from the API
  func getCategories(completion: @escaping (Result<[ModelCategory], Error>) -> Void) {
    guard let categories = categories else {
      self.service.getCategories { result in
        switch result {
        case .success(let categories):
          let mappedCategories = categories.map({ $0.toModel() })
          self.categories = mappedCategories
          completion(Result.success(mappedCategories))
        case .failure(let error):
          completion(Result.failure(error))
        }
      }
      return
    }

    completion(Result.success(categories))
  }
}
