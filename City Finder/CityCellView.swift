//
//  CityCellView.swift
//  City Finder
//
//  Created by Awwad on 8/3/19.
//  Copyright © 2019 awwad. All rights reserved.
//

import Foundation
import UIKit

class CityCellView: UITableViewCell {

  var titleLabel: UILabel!
  var detailLabel: UILabel!

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.backgroundColor = .white

    titleLabel = UILabel()
    titleLabel.adjustsFontSizeToFitWidth = true
    titleLabel.textColor = .black
    titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false

    detailLabel = UILabel()
    detailLabel.adjustsFontSizeToFitWidth = true
    detailLabel.textColor = .black
    detailLabel.translatesAutoresizingMaskIntoConstraints = false

    self.contentView.addSubview(titleLabel)
    self.contentView.addSubview(detailLabel)
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    NSLayoutConstraint.activate([
      titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
      titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
      titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),

      detailLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
      detailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
      detailLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
      detailLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
      detailLabel.heightAnchor.constraint(equalTo: titleLabel.heightAnchor)
      ])
  }

  func populateCell(city: City) {
    titleLabel.text = "\(city.name), \(city.country)"
    detailLabel.text = "Latitude: \(city.location.latitude), Longitude: \(city.location.longitude)"
  }
  
}
