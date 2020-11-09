//
//  SingleSignOnViewController.swift
//  MVVM Basics
//
//  Created by Rajnish Raj on 02/11/20.
//

import UIKit

protocol ProfileSelectionDelegate: class {
    
    func didSelectProfile(user: ProfileViewModel)
    
}

class SingleSignOnViewController: UIViewController {
    
    @IBOutlet var profileLabel: ProfileLabel!
    
    @IBOutlet var collectionView: ProfileCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.profileDelegate = self
    }
}

extension SingleSignOnViewController: ProfileSelectionDelegate {
    
    func didSelectProfile(user: ProfileViewModel) {
        let profileController = self.storyboard?.instantiateViewController(withIdentifier: "SignOnLoginController") as! SignOnLoginController
        profileController.user = user
        present(profileController, animated: true, completion: nil)
    }
    
    
}

