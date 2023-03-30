//
//  UseCaseProviderImpl.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 29/03/2023.
//

import Foundation

class UseCaseProviderImpl: UseCaseProvider {
  private let repositories: RepositoryProvider

  init(repositories: RepositoryProvider) {
    self.repositories = repositories
  }

  func provideGetAdsUseCase() -> GetAdsUseCase {
    return GetAdsUseCase(repository: self.repositories.adsRepository)
  }

  func provideLoadCategoriesUseCase() -> LoadCategoriesUseCase {
    return LoadCategoriesUseCase(repository: self.repositories.categoriesRepository)
  }
}
