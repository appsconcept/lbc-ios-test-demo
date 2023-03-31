//
//  AdDetailView.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 31/03/2023.
//

import UIKit

class AdDetailView: UIView {
  lazy var scrollView: UIScrollView = {
    return UIScrollView()
  }()

  lazy var contentView: UIView = {
    return UIView()
  }()

  // Since there's only one image to show, otherwise we could use a UICollectionView or a UIPageViewController
  lazy var galleryImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.backgroundColor = .systemGroupedBackground
    imageView.contentMode = .scaleAspectFit
    return imageView
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

  lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.text = NSLocalizedString("ads.page.title", comment: "")
    label.textColor = .darkGray
    label.font = .systemFont(ofSize: 24.0, weight: .bold)
    label.numberOfLines = 0
    return label
  }()

  lazy var priceLabel: UILabel = {
    let label = UILabel()
    label.textColor = .orange
    label.font = .systemFont(ofSize: 16.0, weight: .semibold)
    return label
  }()
  
  lazy var topHairlineView: UIView = {
    let view = UIView()
    view.backgroundColor = .orange
    return view
  }()

  lazy var detailsTitleLabel: UILabel = {
    let label = UILabel()
    label.text = NSLocalizedString("ad.detail.page.details.title", comment: "")
    label.textColor = .darkGray
    label.font = .systemFont(ofSize: 16.0, weight: .semibold)
    return label
  }()

  lazy var categoryTitleLabel: UILabel = {
    let label = UILabel()
    label.text = NSLocalizedString("ad.detail.page.category.title", comment: "")
    label.textColor = .darkGray
    label.font = .systemFont(ofSize: 12.0, weight: .semibold)
    return label
  }()

  lazy var categoryValueLabel: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.font = .systemFont(ofSize: 12.0, weight: .regular)
    label.numberOfLines = 0
    return label
  }()

  lazy var bottomHairlineView: UIView = {
    let view = UIView()
    view.backgroundColor = .orange
    return view
  }()

  lazy var descriptionTitleLabel: UILabel = {
    let label = UILabel()
    label.text = NSLocalizedString("ad.detail.page.description.title", comment: "")
    label.textColor = .darkGray
    label.font = .systemFont(ofSize: 16.0, weight: .semibold)
    return label
  }()

  lazy var descriptionValueLabel: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.font = .systemFont(ofSize: 12.0, weight: .regular)
    label.numberOfLines = 0
    return label
  }()

  lazy var dateLabel: UILabel = {
    let label = UILabel()
    label.textColor = .lightGray
    label.font = .systemFont(ofSize: 12.0, weight: .semibold)
    return label
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

    self.scrollView.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(self.scrollView)
    NSLayoutConstraint.activate([
      self.scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
      self.scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      self.scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      self.scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
    ])

    self.contentView.translatesAutoresizingMaskIntoConstraints = false
    self.scrollView.addSubview(self.contentView)
    NSLayoutConstraint.activate([
      self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
      self.contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
      self.contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
      self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
      self.contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor)
    ])

    self.galleryImageView.translatesAutoresizingMaskIntoConstraints = false
    self.contentView.addSubview(self.galleryImageView)
    NSLayoutConstraint.activate([
      self.galleryImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
      self.galleryImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
      self.galleryImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
      self.galleryImageView.heightAnchor.constraint(equalToConstant: 250.0)
    ])

    self.urgentLabel.translatesAutoresizingMaskIntoConstraints = false
    self.contentView.addSubview(self.urgentLabel)
    NSLayoutConstraint.activate([
      self.urgentLabel.topAnchor.constraint(equalTo: self.galleryImageView.topAnchor,
                                            constant: 5.0),
      self.urgentLabel.leadingAnchor.constraint(equalTo: self.galleryImageView.leadingAnchor,
                                                constant: 5.0)
    ])


    self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
    self.contentView.addSubview(self.titleLabel)
    NSLayoutConstraint.activate([
      self.titleLabel.topAnchor.constraint(equalTo: self.galleryImageView.bottomAnchor, constant: 20.0),
      self.titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15.0),
      self.titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15.0)
    ])

    self.priceLabel.translatesAutoresizingMaskIntoConstraints = false
    self.contentView.addSubview(self.priceLabel)
    NSLayoutConstraint.activate([
      self.priceLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 5.0),
      self.priceLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15.0),
      self.priceLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15.0)
    ])

    self.dateLabel.translatesAutoresizingMaskIntoConstraints = false
    self.contentView.addSubview(self.dateLabel)
    NSLayoutConstraint.activate([
      self.dateLabel.topAnchor.constraint(equalTo: self.priceLabel.bottomAnchor, constant: 5.0),
      self.dateLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15.0),
      self.dateLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15.0)
    ])

    self.topHairlineView.translatesAutoresizingMaskIntoConstraints = false
    self.contentView.addSubview(self.topHairlineView)
    NSLayoutConstraint.activate([
      self.topHairlineView.topAnchor.constraint(equalTo: self.dateLabel.bottomAnchor, constant: 5.0),
      self.topHairlineView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15.0),
      self.topHairlineView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15.0),
      self.topHairlineView.heightAnchor.constraint(equalToConstant: 1.0)
    ])

    self.detailsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    self.contentView.addSubview(self.detailsTitleLabel)
    NSLayoutConstraint.activate([
      self.detailsTitleLabel.topAnchor.constraint(equalTo: self.topHairlineView.bottomAnchor, constant: 20.0),
      self.detailsTitleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15.0),
      self.detailsTitleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15.0)
    ])

    self.categoryTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    self.contentView.addSubview(self.categoryTitleLabel)
    NSLayoutConstraint.activate([
      self.categoryTitleLabel.topAnchor.constraint(equalTo: self.detailsTitleLabel.bottomAnchor, constant: 5.0),
      self.categoryTitleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15.0)
    ])

    self.categoryValueLabel.translatesAutoresizingMaskIntoConstraints = false
    self.contentView.addSubview(self.categoryValueLabel)
    NSLayoutConstraint.activate([
      self.categoryValueLabel.topAnchor.constraint(equalTo: self.categoryTitleLabel.topAnchor),
      self.categoryValueLabel.leadingAnchor.constraint(equalTo: self.categoryTitleLabel.trailingAnchor, constant: 5.0),
      self.categoryValueLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15.0)
    ])

    self.bottomHairlineView.translatesAutoresizingMaskIntoConstraints = false
    self.contentView.addSubview(self.bottomHairlineView)
    NSLayoutConstraint.activate([
      self.bottomHairlineView.topAnchor.constraint(equalTo: self.categoryTitleLabel.bottomAnchor, constant: 5.0),
      self.bottomHairlineView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15.0),
      self.bottomHairlineView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15.0),
      self.bottomHairlineView.heightAnchor.constraint(equalToConstant: 1.0)
    ])

    self.descriptionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    self.contentView.addSubview(self.descriptionTitleLabel)
    NSLayoutConstraint.activate([
      self.descriptionTitleLabel.topAnchor.constraint(equalTo: self.bottomHairlineView.bottomAnchor, constant: 20.0),
      self.descriptionTitleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15.0),
      self.descriptionTitleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15.0)
    ])

    self.descriptionValueLabel.translatesAutoresizingMaskIntoConstraints = false
    self.contentView.addSubview(self.descriptionValueLabel)
    NSLayoutConstraint.activate([
      self.descriptionValueLabel.topAnchor.constraint(equalTo: self.descriptionTitleLabel.bottomAnchor, constant: 5.0),
      self.descriptionValueLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15.0),
      self.descriptionValueLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15.0),
      self.descriptionValueLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: -20.0)
    ])
  }

  func configure(classifiedAd: ModelClassifiedAd) {
    self.galleryImageView.imageFromUrl(urlString: classifiedAd.imagesUrl.thumb)
    self.titleLabel.text = classifiedAd.title
    self.priceLabel.text = classifiedAd.price
    self.categoryValueLabel.text = classifiedAd.category.name
    self.descriptionValueLabel.text = classifiedAd.description
    self.dateLabel.text = classifiedAd.creationDate
    self.urgentLabel.isHidden = classifiedAd.isUrgent
  }
}
