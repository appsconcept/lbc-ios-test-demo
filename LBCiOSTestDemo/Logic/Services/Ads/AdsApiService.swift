//
//  AdsApiService.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 29/03/2023.
//

import Foundation

class AdsApiService: AdsService {
  let dataLoader: RemoteDataLoaderService
  let routeProvider: AdsRouteProvider

  required init(dataLoader: DataLoaderService, routeProvider: AdsRouteProvider) {
    self.routeProvider = routeProvider

    guard let loader = dataLoader as? RemoteDataLoaderService else {
      fatalError("AuthServiceImpl expects a RemoteDataLoader")
    }

    self.dataLoader = loader
  }

  func getAds(completion: @escaping (Result<[ClassifiedAdDTO], Error>) -> Void) {
    let request = routeProvider.getAdsRoute()
    print(request)
    dataLoader.loadAndDecode(request: request, type: [ClassifiedAdDTO].self) { (data, error) in
      // Guard response
      guard let data = data, error == nil else {
        completion(Result.failure(error ?? Errors.generic("Failed retrieving the ads")))
        return
      }

      completion(Result.success(data))
    }
  }
}
