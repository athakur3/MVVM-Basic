//
//  SingleSignOnViewController.swift
//  MVVM Basics
//
//  Created by Akshansh Thakur on 02/11/20.
//

import UIKit

class SingleSignOnViewController: UIViewController {
    
    // TODO 2: Create Data Source Variables.
    
    @IBOutlet weak var createProfileButton: UILabel!
    @IBOutlet weak var profileCollectionView: UICollectionView!
    
    var collectionViewLayout: UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = interRowSpacingForProfileCollectionView
        layout.minimumInteritemSpacing = interItemSpacingInRowForProfileCollectionView
        return layout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTapGestureForProfileButton()
        
        // TODO 1: Read JSON FILE
        
        setupCollectionView()
        
    }

    fileprivate func setupTapGestureForProfileButton() {
        let profileLabelTapGesture = UITapGestureRecognizer(target: self, action: #selector(profileLabelTapped(_:)))
        createProfileButton.addGestureRecognizer(profileLabelTapGesture)
    }
    
    @objc func profileLabelTapped(_ sender: UITapGestureRecognizer) {
        
    }
    
    fileprivate func setupCollectionView() {
        profileCollectionView.register(UINib(nibName: ProfileCollectionViewCell.nibName, bundle: Bundle.main), forCellWithReuseIdentifier: ProfileCollectionViewCell.reuseId)
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
        profileCollectionView.collectionViewLayout = collectionViewLayout
    }
    
}

extension SingleSignOnViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.reuseId, for: indexPath) as! ProfileCollectionViewCell
        
        // TODO 5: SET image and label text
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 0.0, left: edgeInsetsForProfileCollectionView, bottom: 0.0, right: edgeInsetsForProfileCollectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let x_ = numberOfItemsInRowForProfileCollectionView
        
        let dimension = (view.frame.width - 2 * edgeInsetsForProfileCollectionView - (x_ - 1) * interItemSpacingInRowForProfileCollectionView) / x_
        
        return CGSize(width: floor(dimension), height: floor(dimension))
        
    }
    
}
