//
//  ImageCache.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 30/03/2023.
//

import UIKit

class ImageCache {
  static let shared = ImageCache()

  // Share cache for every ImageCache instance
  private static var sharedCache: NSCache<NSURL, UIImage> = {
    return NSCache<NSURL, UIImage>()
  }()

  private var internalCache: NSCache<NSURL, UIImage> {
    return ImageCache.sharedCache
  }

  private let queue = DispatchQueue(label: "lbcdemo.imagecache.queue", qos: DispatchQoS.userInteractive, attributes: DispatchQueue.Attributes.concurrent, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.inherit, target: nil)
  private let mainQueue = DispatchQueue.main
  private var diskCacheURL: URL {
    let cacheURL = try! FileManager.default.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("ImageCache")
    try! FileManager.default.createDirectory(at: cacheURL, withIntermediateDirectories: true, attributes: nil)
    return cacheURL
  }

  func evictCache() {
    self.internalCache.removeAllObjects()
  }

  func image(from url: URL, completion: @escaping (UIImage?) -> Void) {
    let fileName = url.absoluteString
    image(from: url, withCacheKey: fileName, completion: completion)
  }

  private func image(from url: URL, withCacheKey cacheKey: String, completion: @escaping (UIImage?) -> Void) {
    queue.async { [mainQueue, internalCache, diskCacheURL] in
      // 1. Fetch the image taht is on the memory cache
      if let cachedImage = internalCache.object(forKey: url as NSURL) {
        mainQueue.async {
          completion(cachedImage)
        }
        return
      }

      // 2. Fetch the image on the disk cache
      let cachedImageURL = diskCacheURL.appendingPathComponent(cacheKey)
      if let cachedData = try? Data(contentsOf: cachedImageURL),
        let image = UIImage(data: cachedData) {
        internalCache.setObject(image, forKey: url as NSURL)
        mainQueue.async {
          completion(image)
        }
        return
      }

      // 3. Download image
      if let data = try? Data(contentsOf: url),
        let image = UIImage(data: data) {
        // 4. Populate cache
        try? data.write(to: cachedImageURL)
        internalCache.setObject(image, forKey: url as NSURL)

        DispatchQueue.main.async {
          completion(image)
        }
      } else {
        mainQueue.async {
          completion(nil)
        }
      }
    }
  }
}
