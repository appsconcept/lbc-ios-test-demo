//
//  AdsListingView.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 29/03/2023.
//

import Foundation
import UIKit

class AdsListingView: UIView {
  lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.text = NSLocalizedString("ads.page.title", comment: "")
    label.textColor = .darkGray
    label.font = .systemFont(ofSize: 24.0, weight: .bold)
    return label
  }()

  lazy var hairlineView: UIView = {
    let view = UIView()
    view.backgroundColor = .orange
    return view
  }()

  lazy var collectionAdapter: AdsListingCollectionAdapter = {
    let holder = AdsListingCollectionAdapter.init()
    holder.view.backgroundColor = .white
    return holder
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

    self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(self.titleLabel)
    NSLayoutConstraint.activate([
      self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20.0),
      self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15.0),
      self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15.0)
    ])

    self.hairlineView.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(self.hairlineView)
    NSLayoutConstraint.activate([
      self.hairlineView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 5.0),
      self.hairlineView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15.0),
      self.hairlineView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      self.hairlineView.heightAnchor.constraint(equalToConstant: 1.0)
    ])

    self.collectionAdapter.view.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(self.collectionAdapter.view)
    NSLayoutConstraint.activate([
      self.collectionAdapter.view.topAnchor.constraint(equalTo: self.hairlineView.bottomAnchor),
      self.collectionAdapter.view.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
      self.collectionAdapter.view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      self.collectionAdapter.view.trailingAnchor.constraint(equalTo: self.trailingAnchor)
    ])
  }
}
