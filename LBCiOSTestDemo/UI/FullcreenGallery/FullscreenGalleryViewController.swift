//
//  FullscreenGalleryViewController.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 01/04/2023.
//

import UIKit

class FullscreenGalleryViewController: UIViewController {
  private let imageUrl: String
  private let classifiedId: Int
  private var fullscreenGalleryView: FullscreenGalleryView!

  init(imageUrl: String, classifiedId: Int) {
    self.imageUrl = imageUrl
    self.classifiedId = classifiedId
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    super.loadView()

    self.fullscreenGalleryView = FullscreenGalleryView()
    self.view = self.fullscreenGalleryView
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    self.fullscreenGalleryView.configure(imageUrl: self.imageUrl, classifiedId: self.classifiedId)
    self.fullscreenGalleryView.closeButton.addTarget(self, action: #selector(close(_:)), for: .touchUpInside)
  }

  @objc private func close(_ sender: UIButton?) {
    self.dismiss(animated: true)
  }
}
