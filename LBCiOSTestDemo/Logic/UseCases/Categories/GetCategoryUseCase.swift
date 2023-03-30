//
//  GetCategoryUseCase.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 30/03/2023.
//

import Foundation

class GetCategoryUseCase {
  let repository: CategoriesRepository

  init(repository: CategoriesRepository) {
    self.repository = repository
  }

  func execute(categoryId: Int) -> ModelCategory {
    if let categories = self.repository.categories {
      return categories.first { category in
        category.id == categoryId
      } ?? ModelCategory(id: categoryId, name: "")
    }

    return ModelCategory(id: categoryId, name: "")
  }
}
