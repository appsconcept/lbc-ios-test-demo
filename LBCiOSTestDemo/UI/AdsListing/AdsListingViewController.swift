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
    // Do any additional setup after loading the view.
  }
}

