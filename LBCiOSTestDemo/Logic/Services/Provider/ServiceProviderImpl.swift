//
//  ServiceProviderImpl.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 29/03/2023.
//

import Foundation

class ServiceProviderImpl: ServiceProvider {
  var remoteDataLoaderService: DataLoaderService
  var adsService: AdsService

  init() {
    self.remoteDataLoaderService = RemoteDataLoaderService()
    self.adsService = AdsApiService(dataLoader: self.remoteDataLoaderService, routeProvider: AdsServiceRoutes(baseUrl: Constants.apiBaseUrl))
  }
}
