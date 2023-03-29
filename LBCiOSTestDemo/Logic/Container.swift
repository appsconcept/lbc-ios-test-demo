//
//  Container.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 29/03/2023.
//

import Foundation

// Class to manage dependency injection manually
class Container {
  static var services: ServiceProvider!
  static var repositories: RepositoryProvider!
  static var useCases: UseCaseProvider!

  // Prevent instantiation
  private init(){}

  static func prodInit(serviceProvider: ServiceProvider, repositoryProvider: RepositoryProvider, useCaseProvider: UseCaseProvider) {
    Container.with(serviceProvider: serviceProvider, repositoryProvider: repositoryProvider, useCaseProvider: useCaseProvider)
  }

  static func with(
    serviceProvider: ServiceProvider,
    repositoryProvider: RepositoryProvider,
    useCaseProvider: UseCaseProvider) {
    Container.services = serviceProvider
    Container.repositories = repositoryProvider
    Container.useCases = useCaseProvider
  }
}
