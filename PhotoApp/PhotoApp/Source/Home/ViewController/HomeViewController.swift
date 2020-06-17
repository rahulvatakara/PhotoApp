//
//  HomeViewController.swift
//  PhotoApp
//
//  Created by Rahul CK on 15/06/20.
//  Copyright © 2020 Synchronoss. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var navigationBarView: UIView!
    @IBOutlet weak var navigationTitleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    var photos:[PhotoItem]?
    var presentor: HomeViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HomeViewRouter.createHomeViewModule(homeviewRef: self)
        activityView.startAnimating()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        presentor.viewDidLoad()
    }
}

//MARK: HomeView Protocol

extension HomeViewController: HomeViewProtocol {
    
    func showPhotos(with photos: [PhotoItem]) {
        self.photos = photos
        errorLabel.isHidden = true
        collectionView.reloadData()
        activityView.stopAnimating()
    }
    
    func showAPIError(message:String) {
        errorLabel.text = message
        errorLabel.isHidden = false
        activityView.stopAnimating()
    }
}

//MARK: CollectionView Delegate and DataSource

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.className, for: indexPath)
        if let photoItem = photos?[indexPath.row] {
            (cell as? PhotoCollectionViewCell)?.configure(photoItem: photoItem)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width / 3) - 15.0
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let photoItem = photos?[indexPath.row] {
            self.presentor.showPhotoSelection(with: photoItem, from: self)
        }
    }
    
    
}
