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
    
    @IBOutlet weak var userImage: UIImageView!
    
    // NOT READY YET WITH ALL FRAMES!!!!!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 12.0
        layer.borderColor = UIColor.black.withAlphaComponent(0.6).cgColor
        layer.borderWidth = 0.5
        
    }
    
}
