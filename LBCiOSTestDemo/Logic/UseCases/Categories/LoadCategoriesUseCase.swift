//
//  LoadCategoriesUseCase.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 30/03/2023.
//

import Foundation

class LoadCategoriesUseCase {
  let repository: CategoriesRepository

  init(repository: CategoriesRepository) {
    self.repository = repository
  }

  // Trigger the retrieval of the categories from the API to cache them
  func execute(completion: @escaping (Bool) -> Void) {
    self.repository.getCategories { result in
      switch result {
      case .success(_):
        completion(true)
      case .failure(_):
        completion(false)
      }
    }
  }
}
