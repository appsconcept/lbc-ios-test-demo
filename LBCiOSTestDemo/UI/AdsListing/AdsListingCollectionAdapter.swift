//
//  AdsListingCollectionAdapter.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 30/03/2023.
//

import Foundation
import UIKit

class AdsListingCollectionAdapter {
  typealias CellRegistration = UICollectionView.CellRegistration<ClassifiedAdCell, ModelClassifiedAd>

  enum Section: Int, CaseIterable {
    case items
  }

  private static let cellReuseID = "classified-ad-cell"

  private lazy var collectionView = makeCollectionView()
  private lazy var dataSource = makeDataSource()

  var view: UICollectionView {
    return self.collectionView
  }

  init() {
    collectionView.register(ClassifiedAdCell.self,
                            forCellWithReuseIdentifier: Self.cellReuseID)
    collectionView.dataSource = dataSource
  }

  func itemsChanged(_ list: [ModelClassifiedAd]) {
    var snapshot = NSDiffableDataSourceSnapshot<Section, ModelClassifiedAd>()
    snapshot.appendSections(Section.allCases)

    snapshot.appendItems(list, toSection: .items)

    dataSource.apply(snapshot)
  }

  private func makeCollectionView() -> UICollectionView {
    UICollectionView(
      frame: .zero,
      collectionViewLayout: makeCollectionViewLayout()
    )
  }

  private func makeCollectionViewLayout() -> UICollectionViewLayout {
    let size = NSCollectionLayoutSize(
        widthDimension: NSCollectionLayoutDimension.fractionalWidth(1),
        heightDimension: NSCollectionLayoutDimension.absolute(160)
    )
    let item = NSCollectionLayoutItem(layoutSize: size)
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitem: item, count: 1)

    let section = NSCollectionLayoutSection(group: group)
    section.interGroupSpacing = 10

    return UICollectionViewCompositionalLayout(section: section)
  }

  private func makeDataSource() -> UICollectionViewDiffableDataSource<Section, ModelClassifiedAd> {
    UICollectionViewDiffableDataSource(
      collectionView: collectionView,
      cellProvider: makeCellRegistration().cellProvider
    )
  }

  private func makeCellRegistration() -> CellRegistration {
    CellRegistration { cell, _, classifiedAd in
      cell.configure(classifiedAd: classifiedAd)
    }
  }
}

fileprivate extension UICollectionView.CellRegistration {
  var cellProvider: (UICollectionView, IndexPath, Item) -> Cell {
    return { collectionView, indexPath, item in
      collectionView.dequeueConfiguredReusableCell(
        using: self,
        for: indexPath,
        item: item
      )
    }
  }
}
