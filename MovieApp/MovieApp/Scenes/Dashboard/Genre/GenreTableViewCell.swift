//
//  GenreTableViewCell.swift
//  MovieApp
//
//  Created by gokalp.koksal on 10.08.2022.
//

import UIKit

class GenreTableViewCell: UITableViewCell {

    static let identifier = "GenreTableViewCell"
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var genreImageView: UIImageView!
    @IBOutlet weak var genreTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bottomView.backgroundColor = UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 0.65)
    }
    
    func setup() {
        // TODO: Set content with presentation
        genreImageView.image = UIImage(named: "breakingBad")
        genreTitleLabel.text = "Animation"
    }
    
}
