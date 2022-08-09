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
    @IBOutlet private weak var button: UIButton!
    
    private let backgroundImageNames = ["breakingBad", "friends", "walkingDead"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContent()
    }
    @IBAction func explorePressed(_ sender: Any) {
        // TODO: Implement navigation to dashboard.
//        let storyboard = UIStoryboard(name: "Dashboard", bundle: nil)
//        if let tabBarVC = storyboard.instantiateViewController(withIdentifier: "DashboardTabBarController") as? UITabBarController {
//            if let vcs = tabBarVC.viewControllers, let discoverVC = vcs.first as? DiscoverViewController {
//                show(discoverVC, sender: self)
//            }
//        }
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
        descriptionLabel.font = UIFont.systemFont(ofSize: 17)
        descriptionLabel.textColor = .white
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
    }
    
    private func configureTitleLabel() {
        // TODO: Fix according to Zeplin design.
        titleLabel.text = "Movies & Series"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 40)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.shadowOffset = CGSize(width: 0.5, height: 0.5)
        titleLabel.shadowColor = .darkGray
    }
    
    private func configureExploreButton() {
        // TODO: Update title fonts according to Zeplin design.
        button.setTitle("Explore Collection", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button.setTitleColor(.white, for: .normal)
        // button.backgroundColor = UIColor(red: 2, green: 148, blue: 165, alpha: 0.8)
        button.backgroundColor = .systemTeal
    }
    
    private func configurePageControl() {
        // TODO: update colors according to zeplin
        pageControl.numberOfPages = backgroundImageNames.count
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = .darkGray
        pageControl.pageIndicatorTintColor = .lightGray
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
    
    // TODO: Fix cells are not ignoring safe areas.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

