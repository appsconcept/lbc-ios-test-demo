//
//  Bootloader.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 30/03/2023.
//

import Foundation

class Bootloader {
  func start() {
    setupContainer()
  }

  private func setupContainer() {
    let services = ServiceProviderImpl()
    let repositories = RepositoryProviderImpl(services: services)
    let useCases = UseCaseProviderImpl(repositories: repositories)
    Container.prodInit(serviceProvider: services, repositoryProvider: repositories, useCaseProvider: useCases)
  }
}
