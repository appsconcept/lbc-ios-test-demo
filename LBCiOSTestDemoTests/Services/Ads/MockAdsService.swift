//
//  MockAdsService.swift
//  LBCiOSTestDemoTests
//
//  Created by Marco Appsconcept on 31/03/2023.
//

import Foundation
@testable import LBCiOSTestDemo

class MockAdsService: AdsService {
  let routeProvider: AdsRouteProvider
  let dataLoader: DataLoaderService

  required init(routeProvider: AdsRouteProvider, dataLoader: DataLoaderService) {
    self.routeProvider = routeProvider
    self.dataLoader = dataLoader
  }

  func getAds(completion: @escaping (Result<[LBCiOSTestDemo.ClassifiedAdDTO], Error>) -> Void) {
    dataLoader.loadAndDecode(request: routeProvider.getAdsRoute(),
                             type: [ClassifiedAdDTO].self) { (data, error) in
      guard let ads = data, error == nil else {
        completion(Result.failure(error ?? Errors.unknownError))
        return
      }

      completion(Result.success(ads))
    }
  }
}
