//
//  ViewController.swift
//  MovieApp
//
//  Created by gokalp.koksal on 3.08.2022.
//

import UIKit

// TODO: Fix collection view content
class LandingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
    }

}

extension LandingViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    // TODO: change number of items with landing image count
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    // TODO: return correct cell with image etc.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
    
}

extension LandingViewController: UICollectionViewDelegateFlowLayout {
    
    // TODO: Fix cells are not ignoring safe areas.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}

