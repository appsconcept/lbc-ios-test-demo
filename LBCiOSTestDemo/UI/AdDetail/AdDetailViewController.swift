//
//  AdDetailViewController.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 31/03/2023.
//

import UIKit

class AdDetailViewController: UIViewController {
  private let viewModel: AdDetailViewModel
  private var adDetailView: AdDetailView!

  init(viewModel: AdDetailViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    super.loadView()

    self.adDetailView = AdDetailView()
    self.view = self.adDetailView
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    let classifiedAd = self.viewModel.load()
    self.adDetailView.configure(classifiedAd: classifiedAd)
  }
}
