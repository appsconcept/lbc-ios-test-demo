//
//  LaunchView.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 01/04/2023.
//

import Foundation

import UIKit

class LaunchView: UIView {

  lazy var logoImageView: UIImageView = {
    return UIImageView(image: UIImage(named: "Logo"))
  }()

  init() {
    super.init(frame: .zero)
    self.setup()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setup() {
    self.backgroundColor = .white
    self.addSubview(self.logoImageView)
    self.logoImageView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      self.logoImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
      self.logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      self.logoImageView.widthAnchor.constraint(equalToConstant: 282),
      self.logoImageView.heightAnchor.constraint(equalToConstant: 76)
    ])
  }
}
