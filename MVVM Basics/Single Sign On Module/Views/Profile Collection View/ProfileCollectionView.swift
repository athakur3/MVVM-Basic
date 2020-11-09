//
//  ProfileCollectionView.swift
//  MVVM Basics
//
//  Created by Rajnish on 07/11/20.
//

import UIKit

class ProfileCollectionView: UICollectionView {
    
    var users = [ProfileViewModel]() {
        didSet {
            DispatchQueue.main.async {
                self.layoutIfNeeded()
                self.setupCollectionView()
            }
        }
    }
    
    weak var profileDelegate: ProfileSelectionDelegate?
    
    
    var layout: UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = interRowSpacingForProfileCollectionView
        layout.minimumInteritemSpacing = interItemSpacingInRowForProfileCollectionView
        return layout
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        users = ProfileViewModel.fetchData() ?? []
        
        
    }
        
    fileprivate func setupCollectionView() {
        register(UINib(nibName: ProfileCollectionViewCell.nibName, bundle: Bundle.main), forCellWithReuseIdentifier: ProfileCollectionViewCell.reuseId)
        delegate = self
        dataSource = self
        collectionViewLayout = layout
    }
    
}

extension ProfileCollectionView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.reuseId, for: indexPath) as! ProfileCollectionViewCell
        
        cell.profileViewModel = users[indexPath.row]
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 0.0, left: edgeInsetsForProfileCollectionView, bottom: 0.0, right: edgeInsetsForProfileCollectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let x_ = numberOfItemsInRowForProfileCollectionView
        
        let dimension = (UIScreen.main.bounds.width - 2 * edgeInsetsForProfileCollectionView - (x_ - 1) * interItemSpacingInRowForProfileCollectionView) / x_
        
        return CGSize(width: floor(dimension), height: floor(dimension))
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
       //TODO: Task is to go to new controller.
    
        profileDelegate?.didSelectProfile(user: users[indexPath.row])
        
        
    }
    
}
