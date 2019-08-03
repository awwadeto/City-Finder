//
//  AboutViewController.swift
//  City Finder
//
//  Created by Awwad on 8/3/19.
//  Copyright © 2019 awwad. All rights reserved.
//

import Foundation
import UIKit

class AboutViewController: UITableViewController {

  var viewModel: AboutViewModel!
  let activityIndicatorView = UIActivityIndicatorView(style: .gray)

  override func viewDidLoad() {
    super.viewDidLoad()
    viewModel = AboutViewModel(viewController: self)
    self.tableView.separatorStyle = .none

    self.navigationItem.titleView = self.activityIndicatorView
    self.activityIndicatorView.hidesWhenStopped = true

    self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(closeView))
  }

  @objc func closeView() {
    self.dismiss(animated: true, completion: nil)
  }

}
