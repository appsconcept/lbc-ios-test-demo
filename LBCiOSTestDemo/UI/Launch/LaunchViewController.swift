//
//  LaunchViewController.swift
//  LBCiOSTestDemo
//
//  Created by Marco Appsconcept on 01/04/2023.
//

import UIKit

protocol LaunchViewControllerDelegate: AnyObject {
  func launchViewControllerDidFinishSync(_ controller: LaunchViewController)
}

class LaunchViewController: UIViewController {
  private let viewModel: LaunchViewModel
  private var lauchView: LaunchView!

  weak var delegate: LaunchViewControllerDelegate?

  init(viewModel: LaunchViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    super.loadView()
    self.lauchView = LaunchView()
    self.view = self.lauchView
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    self.boot()
  }

  private func boot() {
    viewModel.bootstrap { didLoad in
      DispatchQueue.main.async { [weak self] in
        if(didLoad) {
          if let strongSelf = self {
            strongSelf.delegate?.launchViewControllerDidFinishSync(strongSelf)
          }
        } else {
          self?.retry()
        }
      }
    }
  }

  private func retry() {
    let alert = UIAlertController(title: NSLocalizedString("globals.error.title", comment: ""),
                                  message: NSLocalizedString("launch.page.error.message", comment: ""),
                                  preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: NSLocalizedString("globals.retry", comment: ""),
                                  style: .default) { _ in
      self.boot()
    })

    self.present(alert, animated: true, completion: nil)
  }
}
