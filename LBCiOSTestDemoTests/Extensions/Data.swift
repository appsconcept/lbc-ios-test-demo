//
//  Data.swift
//  LBCiOSTestDemoTests
//
//  Created by Marco Appsconcept on 31/03/2023.
//

import Foundation
@testable import LBCiOSTestDemo

extension Data{
  static func loadContentsOf(file: String, withExtension ext: String) throws -> Data{
    // Get test bundle (associated with any class file - e.g. MockServiceProvider)
    let bundle = Bundle(for: MockDataLoaderService.self)
    guard let url = bundle.url(forResource: file, withExtension: ext) else {
      throw Errors.generic("Missing file: \(file).\(ext)")
    }
    return try Data(contentsOf: url)
  }

  static func loadAndDecodeContentsOf<T>(_ type: T.Type, file: String) throws -> T where T : Decodable {
    let data = try Data.loadContentsOf(file: file, withExtension: "json")
    return try JSONDecoder().decode(type, from: data)
  }
}
