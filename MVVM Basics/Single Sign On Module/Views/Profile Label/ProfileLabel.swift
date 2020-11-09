//
//  ProfileLabel.swift
//  MVVM Basics
//
//  Created by Rajnish on 08/11/20.
//

import UIKit

class ProfileLabel: UILabel {

    override func awakeFromNib() {
        super.awakeFromNib()
        setupTapGestureForProfileButton()
    }

    fileprivate func setupTapGestureForProfileButton() {
        let profileLabelTapGesture = UITapGestureRecognizer(target: self, action: #selector(profileLabelTapped(_:)))
        addGestureRecognizer(profileLabelTapGesture)
    }
    
    @objc func profileLabelTapped(_ sender: UITapGestureRecognizer) {
           
    }
}
