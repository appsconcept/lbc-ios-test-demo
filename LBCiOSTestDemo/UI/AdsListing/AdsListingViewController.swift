//
//  ViewController.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 29/03/2023.
//

import UIKit

class AdsListingViewController: UIViewController {
  private let viewModel: AdsListingViewModel
  private var adsListingView: AdsListingView!

  init(viewModel: AdsListingViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    super.loadView()

    self.navigationItem.backButtonTitle = ""

    self.adsListingView = AdsListingView()
    self.view = self.adsListingView
    self.adsListingView.collectionAdapter.view.delegate = self
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    self.viewModel.load { result in
      switch result {
      case .success(let ads):
        self.adsListingView.collectionAdapter.itemsChanged(ads)
      case .failure(_):
        let alert = UIAlertController(title: NSLocalizedString("globals.error.title", comment: ""),
                                      message: NSLocalizedString("ads.page.error.fetchAds.message", comment: ""),
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("globals.ok", comment: ""),
                                      style: .default) { _ in
          alert.dismiss(animated: true, completion: nil)
        })

        self.present(alert, animated: true, completion: nil)
      }
    }
  }
}

extension AdsListingViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    collectionView.deselectItem(at: indexPath, animated: true)
    if let classifiedAd = self.viewModel.getAd(index: indexPath.row) {
      let adDetailViewController = AdDetailViewController(viewModel: AdDetailViewModel(classifiedAd: classifiedAd))
      self.navigationController?.pushViewController(adDetailViewController, animated: true)
    } else {
      let alert = UIAlertController(title: NSLocalizedString("globals.error.title", comment: ""),
                                    message: NSLocalizedString("ads.page.error.openAd.message", comment: ""),
                                    preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: NSLocalizedString("globals.ok", comment: ""),
                                    style: .default) { _ in
        alert.dismiss(animated: true, completion: nil)
      })

      self.present(alert, animated: true, completion: nil)
    }
  }
}

