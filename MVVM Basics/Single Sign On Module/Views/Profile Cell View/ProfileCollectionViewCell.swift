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
    
    @IBOutlet var userName: UILabel!
    // NOT READY YET WITH ALL FRAMES!!!!!
    override func awakeFromNib() { // NIB PE JO THA, WAHI UTHA LIYA
        super.awakeFromNib()
        
        layer.cornerRadius = 12.0
        layer.borderColor = UIColor.black.withAlphaComponent(0.6).cgColor
        layer.borderWidth = 0.5
        
        /*
         
         Solution 1.
         
         UIView.animate(withDuration: 0.0) {
             self.layoutIfNeeded()
         } completion: { (value) in
             self.userImage.layer.cornerRadius = self.userImage.frame.width / 2.0
         }
         
         */
        
        // Solution 2.
        
        DispatchQueue.main.async {
            self.layoutIfNeeded()
            self.userImage.layer.cornerRadius = self.userImage.frame.width / 2.0
        }
        
    }
    
}
