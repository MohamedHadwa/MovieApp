//
//  MovieListTableViewCell.swift
//  MovieApp
//
//  Created by Mohamed Hadwa on 06/03/2023.
//

import UIKit
import Kingfisher

class MovieListTableViewCell: UITableViewCell {

    // MARK: - IBOutlets.
    @IBOutlet weak var cellBackgroundView: UIView!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieGenres: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    // MARK: - Private Variables.
    
    static let identifire = "movieCell"
    static func nib() ->UINib{
        return UINib(nibName: "MovieListTableViewCell", bundle: nil)
    }
    // MARK: - View Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initDesign()
    }
    // MARK: - IBActions.
    
    
    // MARK: - Private Functions.
    
    func initDesign(){
        self.cellBackgroundView.layer.cornerRadius = 25
        self.cellBackgroundView.layer.borderWidth = 1.5
        self.cellBackgroundView.layer.borderColor = #colorLiteral(red: 0.4156862745, green: 0.7529411765, blue: 0.2705882353, alpha: 1)
        self.cellBackgroundView.clipsToBounds = true
    }
    
    func configure(with data: Movie){
        self.movieTitle.text = data.title
        self.movieRating.text = "⭐️ \(data.rating ?? 0.0) / 10"
        self.movieGenres.text = data.genres?.joined(separator: ", ")
        guard let imgURL = URL(string: data.smallCoverImage ?? "" ) else { return  }
         let recource = ImageResource(downloadURL: imgURL)
        self.movieImage.kf.setImage(with: recource)
        self.selectionStyle = .none
    }

    
}

// MARK: - <#UI.....#> Delegate & DataSource.

//extension <#UIviewController#> {
//
//
//}
//
//// MARK: - APi.
//
//extension <#UIviewController#> {
//
//
//
//}


