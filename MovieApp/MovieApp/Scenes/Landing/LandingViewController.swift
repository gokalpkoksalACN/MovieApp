//
//  ViewController.swift
//  MovieApp
//
//  Created by gokalp.koksal on 3.08.2022.
//

import UIKit

// TODO: Fix collection view content
class LandingViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var pageControl: UIPageControl!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var buttonView: UIView!
    
    private let backgroundImageNames = ["walkingDead", "friends", "breakingBad"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContent()
        navigationController?.navigationBar.isHidden = true
    }
    @objc func explorePressed(_ sender: Any) {
        performSegue(withIdentifier: "landingToDashboard", sender: nil)
    }
    
    private func configureContent() {
        configureCollectionView()
        configurePageControl()
        configureExploreButton()
        configureTitleLabel()
        configureDescriptionTitle()
    }
    
    private func configureDescriptionTitle() {
        descriptionLabel.text = "The world’s most popular and authoritative source for movies and series."
        descriptionLabel.font = .appFont(with: 17)
        descriptionLabel.layer.applySketchShadow(color: UIColor(red: 0, green: 0, blue: 0, alpha: 0.5), x: 0, y: 2, blur: 4, spread: 0)
        descriptionLabel.textColor = .white
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
    }
    
    private func configureTitleLabel() {
        titleLabel.text = "Movies & Series"
        titleLabel.font = .appFont(with: 40)
        titleLabel.layer.applySketchShadow(color: UIColor(red: 0, green: 0, blue: 0, alpha: 0.5), x: 0, y: 2, blur: 4, spread: 0)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.shadowOffset = CGSize(width: 0.5, height: 0.5)
        titleLabel.shadowColor = .darkGray
    }
    
    private func configureExploreButton() {
        let exploreLabel = UILabel()
        exploreLabel.text = "Explore Collection"
        exploreLabel.font = .appFont(with: 24)
        exploreLabel.textColor = .white
        exploreLabel.textAlignment = .center
        exploreLabel.addCharacterSpacing(kernValue: -1.06)
        
        let chevronRightImage = UIImage(named: "chevron_right")?.withRenderingMode(.alwaysTemplate)
        let arrowSign = UIImageView(image: chevronRightImage)
        arrowSign.tintColor = .white
        
        
        
        buttonView.addSubview(arrowSign)
        buttonView.addSubview(exploreLabel)
        buttonView.backgroundColor = AppColors.tealBlue_80
        buttonView.layer.cornerRadius = 7.0
        
        exploreLabel.translatesAutoresizingMaskIntoConstraints = false
        exploreLabel.sizeToFit()
        exploreLabel.leftAnchor.constraint(equalTo: buttonView.leftAnchor, constant: 30).isActive = true
        exploreLabel.rightAnchor.constraint(equalTo: arrowSign.leftAnchor, constant: -20).isActive = true
        exploreLabel.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor).isActive = true
        
        arrowSign.translatesAutoresizingMaskIntoConstraints = false
        arrowSign.widthAnchor.constraint(equalToConstant: 18).isActive = true
        arrowSign.heightAnchor.constraint(equalToConstant: 20).isActive = true
        arrowSign.rightAnchor.constraint(equalTo: buttonView.rightAnchor, constant: -20).isActive = true
        arrowSign.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor).isActive = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(explorePressed(_:)))
        buttonView.addGestureRecognizer(gestureRecognizer)
    }
    
    private func configurePageControl() {
        pageControl.numberOfPages = backgroundImageNames.count
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = AppColors.tealBlue
        pageControl.pageIndicatorTintColor = .white
    }
    
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        collectionView.register(LandingScreenCell.self, forCellWithReuseIdentifier: LandingScreenCell.identifier)
        collectionView.isPagingEnabled = true
    }

}

extension LandingViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return backgroundImageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LandingScreenCell.identifier, for: indexPath) as? LandingScreenCell {
            cell.setup(with: backgroundImageNames[indexPath.item])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
    }
    
}

extension LandingViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

