//
//  SingOnLoginController.swift
//  MVVM Basics
//
//  Created by Rajnish on 09/11/20.
//

import UIKit

class SignOnLoginController: UIViewController {

    var user: ProfileViewModel?
    
    
    @IBOutlet var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

     self.profileImage.layer.cornerRadius = self.profileImage.frame.width / 2.0
        
        profileImage.image = UIImage(named: user!.image)
        
    }
    

}
