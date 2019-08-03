//
//  AboutView+TableView.swift
//  City Finder
//
//  Created by Awwad on 8/3/19.
//  Copyright © 2019 awwad. All rights reserved.
//

import Foundation
import UIKit

extension AboutViewController {

  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfCells
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let aboutInfo = viewModel.aboutInfo else { return UITableViewCell() }

    let field = viewModel.fields[indexPath.row]
    let cell: UITableViewCell
    if let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: "AboutInfoCell") {
      cell = dequeuedCell
    } else {
      cell = UITableViewCell(style: .value2, reuseIdentifier: "AboutInfoCell")
      cell.selectionStyle = .none
    }

    cell.textLabel?.text = field.name
    cell.detailTextLabel?.text = aboutInfo[keyPath: field.keyPath]

    return cell
  }
}
