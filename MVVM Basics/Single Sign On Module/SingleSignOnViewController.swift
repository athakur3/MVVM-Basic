//
//  SingleSignOnViewController.swift
//  MVVM Basics
//
//  Created by Rajnish Raj on 02/11/20.
//

import UIKit

class SingleSignOnViewController: UIViewController {
    
    var users = [User]()
    
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
        fetchData()
        setupCollectionView()
        
    }
    func fetchData(){
        guard let filePath = Bundle.main.path(forResource: "Data", ofType: "json") else { return }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath:  filePath), options: .mappedIfSafe)
            users = try JSONDecoder().decode([User].self, from: data)
        } catch {
            print(error)
            
        }
        
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
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.reuseId, for: indexPath) as! ProfileCollectionViewCell
        
        
        cell.userName.text = "\(users[indexPath.row].firstName) \(users[indexPath.row].lastName)"
        cell.userImage.image = UIImage(named: users[indexPath.row].image)
        
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
