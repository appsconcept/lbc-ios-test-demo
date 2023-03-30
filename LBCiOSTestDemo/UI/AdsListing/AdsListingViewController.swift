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

    self.adsListingView = AdsListingView()
    self.view = self.adsListingView
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    self.viewModel.load { result in
      switch result {
      case .success(let ads):
        self.adsListingView.collectionAdapter.itemsChanged(ads)
      case .failure(_):
        let alert = UIAlertController(title: NSLocalizedString("", comment: ""),
                                      message: NSLocalizedString("", comment: ""),
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("", comment: ""),
                                      style: .default) { _ in
          alert.dismiss(animated: true, completion: nil)
        })

        self.present(alert, animated: true, completion: nil)
      }
    }
  }
}

