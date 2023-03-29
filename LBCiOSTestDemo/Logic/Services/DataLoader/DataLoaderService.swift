//
//  DataLoaderService.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 29/03/2023.
//

import Foundation

protocol DataLoaderService {
  func load(request: URLRequest, completion: @escaping (Data?, Error?) -> Void)
  func loadAndDecode<T>(request: URLRequest, type: T.Type, completion: @escaping (T?, Error?) -> Void) where T : Decodable
}

extension DataLoaderService {
  func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable {
    let decoder = JSONDecoder()
    return try decoder.decode(type, from: data)
  }

  func loadAndDecode<T>(request: URLRequest, type: T.Type, completion: @escaping (T?, Error?) -> Void) where T : Decodable {
    self.load(request: request) { (data, error) in
      // Guard response
      if let error = error {
        completion(nil, error)
        return
      }
      guard let data = data else {
        completion(nil, Errors.unknownError)
        return
      }

      // Bail if empty
      if data.count == 0 {
        completion(nil, nil)
        return
      }

      // Decode and return
      var decodedData: T?
      do {
        decodedData = try self.decode(type, from: data)
      } catch {
        completion(nil, error)
        return
      }

      if let decodedData = decodedData {
        completion(decodedData, nil)
      }
    }
  }
}
