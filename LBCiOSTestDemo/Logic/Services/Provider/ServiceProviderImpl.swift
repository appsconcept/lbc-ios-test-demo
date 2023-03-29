//
//  ServiceProviderImpl.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 29/03/2023.
//

import Foundation

class ServiceProviderImpl: ServiceProvider {
  var remoteDataLoaderService: DataLoaderService

  init() {
    self.remoteDataLoaderService = RemoteDataLoaderService()
  }
}
