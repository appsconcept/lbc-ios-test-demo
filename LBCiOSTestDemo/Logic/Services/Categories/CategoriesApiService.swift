//
//  CategoriesApiService.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 30/03/2023.
//

import Foundation

class CategoriesApiService: CategoriesService {
  let dataLoader: RemoteDataLoaderService
  let routeProvider: CategoriesRouteProvider

  required init(dataLoader: DataLoaderService, routeProvider: CategoriesRouteProvider) {
    self.routeProvider = routeProvider

    guard let loader = dataLoader as? RemoteDataLoaderService else {
      fatalError("AuthServiceImpl expects a RemoteDataLoader")
    }

    self.dataLoader = loader
  }

  func getCategories(completion: @escaping (Result<[CategoryDTO], Error>) -> Void) {
    let request = routeProvider.getCategoriesRoute()
    dataLoader.loadAndDecode(request: request, type: [CategoryDTO].self) { (data, error) in
      // Guard response
      guard let data = data, error == nil else {
        completion(Result.failure(error ?? Errors.generic("Failed retrieving the ads")))
        return
      }

      completion(Result.success(data))
    }
  }
}
