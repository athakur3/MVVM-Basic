//
//  ProfileCollectionViewCell.swift
//  MVVM Basics
//
//  Created by Akshansh Thakur on 02/11/20.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {

    static var reuseId = "ProfileCollectionViewCellID"
    static var nibName = "ProfileCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .blue
        
    }

}
