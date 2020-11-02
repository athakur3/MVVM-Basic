//
//  SingleSignOnViewController.swift
//  MVVM Basics
//
//  Created by Akshansh Thakur on 02/11/20.
//

import UIKit

class SingleSignOnViewController: UIViewController {
    
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
        setupCollectionView()
        
    }

    fileprivate func setupTapGestureForProfileButton() {
        let profileLabelTapGesture = UITapGestureRecognizer(target: self, action: #selector(profileLabelTapped(_:)))
        createProfileButton.addGestureRecognizer(profileLabelTapGesture)
    }
    
    @objc func profileLabelTapped(_ sender: UITapGestureRecognizer) {
        
    }
    
    fileprivate func setupCollectionView() {
        // TODO:- Setup CollectionView
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
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.reuseId, for: indexPath)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 0.0, left: edgeInsetsForProfileCollectionView, bottom: 0.0, right: edgeInsetsForProfileCollectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let dimension = (view.frame.width - 2 * edgeInsetsForProfileCollectionView - interItemSpacingInRowForProfileCollectionView) / numberOfItemsInRowForProfileCollectionView
        
        return CGSize(width: dimension, height: dimension)
        
    }
    
}
