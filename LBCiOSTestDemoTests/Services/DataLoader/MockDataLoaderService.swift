//
//  MockDataLoaderService.swift
//  LBCiOSTestDemoTests
//
//  Created by Marco Appsconcept on 31/03/2023.
//

import Foundation

import Foundation
@testable import LBCiOSTestDemo

class MockDataLoaderService: DataLoaderService {
  func load(request: URLRequest, completion: @escaping (Data?, Error?) -> Void) {
    if let fileName = request.url?.lastPathComponent {
      var data: Data?
      do {
        data = try Data.loadContentsOf(file: fileName, withExtension: "json")
      } catch {
        completion(nil, error)
        return
      }

      if let data = data {
        completion(data, nil)
      }
    } else {
      completion(nil, Errors.generic("Failed to parse file name/extension from URLRequest"))
    }
  }
}
