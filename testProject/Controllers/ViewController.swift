//
//  ViewController.swift
//  testProject
//
//  Created by Георгий Ступаков on 2/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    var flickrs = [FlickrModel]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        NetworkingManager.shared.getFlickrs { response in
            self.flickrs = response.flickrs
            self.collectionView.reloadData()
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! DetailsViewController
        if let indexPath = collectionView.indexPathsForSelectedItems?.first {
            destinationVC.detailFlickrs = flickrs[indexPath.row]
        }
    }
    
}

//MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return flickrs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! PhotoCell
        
        cell.configure(witn: flickrs[indexPath.row])
        return cell
    }
    
}

//MARK: - UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = collectionView.bounds.width / 2
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
}

