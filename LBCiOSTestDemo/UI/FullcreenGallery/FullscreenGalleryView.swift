//
//  FullscreenGalleryView.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 01/04/2023.
//

import UIKit

import UIKit

class FullscreenGalleryView: UIView {
  lazy var closeButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(UIImage(named: "Close"), for: .normal)
    button.tintColor = .white
    return button
  }()

  lazy var galleryImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.backgroundColor = .systemGroupedBackground
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()

  init() {
    super.init(frame: .zero)
    self.setup()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setup() {
    self.backgroundColor = .black

    self.addSubview(self.closeButton)
    self.closeButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      self.closeButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 15.0),
      self.closeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15.0)
    ])

    self.addSubview(self.galleryImageView)
    self.galleryImageView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      self.galleryImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
      self.galleryImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      self.galleryImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
    ])
  }

  func configure(imageUrl: String, classifiedId: Int) {
    self.galleryImageView.tag = classifiedId
    self.galleryImageView.imageFromUrl(urlString: imageUrl, with: classifiedId)
  }
}

