//
//  ClassifiedAdCell.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 30/03/2023.
//

import Foundation
import UIKit

class ClassifiedAdCell: UICollectionViewCell {

  lazy var thumbnailImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.backgroundColor = .systemGroupedBackground
    imageView.contentMode = .scaleAspectFit
    imageView.layer.cornerRadius = 5
    imageView.clipsToBounds = true
    return imageView
  }()

  lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.textColor = .darkGray
    label.numberOfLines = 0
    label.font = .systemFont(ofSize: 16.0, weight: .semibold)
    return label
  }()

  lazy var priceLabel: UILabel = {
    let label = UILabel()
    label.textColor = .orange
    label.font = .systemFont(ofSize: 14.0, weight: .semibold)
    return label
  }()

  lazy var urgentLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 12.0)
    label.text = NSLocalizedString("ads.page.cell.urgent.label", comment: "")
    label.textColor = .white
    label.backgroundColor = .orange
    label.layoutMargins = UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
    label.layer.cornerRadius = 3
    label.layer.masksToBounds = true
    return label
  }()

  lazy var bottomHairline: UIView = {
    let view = UIView()
    view.backgroundColor = .orange
    return view
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.setup()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setup() {
    self.backgroundColor = .white

    self.bottomHairline.translatesAutoresizingMaskIntoConstraints = false
    self.contentView.addSubview(self.bottomHairline)
    NSLayoutConstraint.activate([
      self.bottomHairline.bottomAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.bottomAnchor),
      self.bottomHairline.leadingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leadingAnchor, constant: 15.0),
      self.bottomHairline.trailingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.trailingAnchor, constant: -15.0),
      self.bottomHairline.heightAnchor.constraint(equalToConstant: 1.0)
    ])

    self.thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
    self.contentView.addSubview(self.thumbnailImageView)
    NSLayoutConstraint.activate([
      self.thumbnailImageView.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor,
                                          constant: 15.0),
      self.thumbnailImageView.leadingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leadingAnchor,
                                              constant: 15.0),
      self.thumbnailImageView.bottomAnchor.constraint(equalTo: self.bottomHairline.topAnchor,
                                               constant: -5.0),
      self.thumbnailImageView.widthAnchor.constraint(equalToConstant: 150.0)
    ])

    self.urgentLabel.translatesAutoresizingMaskIntoConstraints = false
    self.contentView.addSubview(self.urgentLabel)
    NSLayoutConstraint.activate([
      self.urgentLabel.topAnchor.constraint(equalTo: self.thumbnailImageView.topAnchor,
                                          constant: 5.0),
      self.urgentLabel.leadingAnchor.constraint(equalTo: self.thumbnailImageView.leadingAnchor,
                                              constant: 5.0)
    ])

    self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
    self.contentView.addSubview(self.titleLabel)
    NSLayoutConstraint.activate([
      self.titleLabel.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor,
                                          constant: 15.0),
      self.titleLabel.leadingAnchor.constraint(equalTo: self.thumbnailImageView.trailingAnchor,
                                              constant: 15.0),
      self.titleLabel.trailingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.trailingAnchor,
                                               constant: -15.0)
    ])

    self.priceLabel.translatesAutoresizingMaskIntoConstraints = false
    self.contentView.addSubview(self.priceLabel)
    NSLayoutConstraint.activate([
      self.priceLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor,
                                          constant: 5.0),
      self.priceLabel.leadingAnchor.constraint(equalTo: self.thumbnailImageView.trailingAnchor,
                                              constant: 15.0),
      self.priceLabel.trailingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.trailingAnchor,
                                               constant: -15.0)
    ])
  }

  func configure(classifiedAd: ModelClassifiedAd) {
    self.thumbnailImageView.image = nil
    self.thumbnailImageView.imageFromUrl(urlString: classifiedAd.imagesUrl.small)

    self.titleLabel.text = classifiedAd.title
    self.priceLabel.text = classifiedAd.price
    self.urgentLabel.isHidden = classifiedAd.isUrgent
  }
}
