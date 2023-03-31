//
//  MockCategoriesService.swift
//  LBCiOSTestDemoTests
//
//  Created by Marco Appsconcept on 31/03/2023.
//

import Foundation
@testable import LBCiOSTestDemo

class MockCategoriesService: CategoriesService {
  let routeProvider: CategoriesRouteProvider
  let dataLoader: DataLoaderService

  required init(routeProvider: CategoriesRouteProvider, dataLoader: DataLoaderService) {
    self.routeProvider = routeProvider
    self.dataLoader = dataLoader
  }

  func getCategories(completion: @escaping (Result<[LBCiOSTestDemo.CategoryDTO], Error>) -> Void) {
    dataLoader.loadAndDecode(request: routeProvider.getCategoriesRoute(),
                             type: [CategoryDTO].self) { (data, error) in
      guard let categories = data, error == nil else {
        completion(Result.failure(error ?? Errors.unknownError))
        return
      }

      completion(Result.success(categories))
    }
  }
}
