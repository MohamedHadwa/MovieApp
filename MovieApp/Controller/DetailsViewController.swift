//
//  DetailsViewController.swift
//  MovieApp
//
//  Created by Mohamed Hadwa on 06/03/2023.
//

import UIKit
import Alamofire
import Kingfisher
class DetailsViewController: UIViewController {

    // MARK: - IBOutlets.
    
    
    @IBOutlet weak var watchBtn: UIButton!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieGeners: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieFullDescription: UILabel!
    
    // MARK: - Private Variables.
    var movieDetails: Movie?

    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        displayDataInTheView()
        watchBtn.layer.cornerRadius = 15
        
        


    }
    // MARK: - IBActions.
    
    @IBAction func watchMovieBtnPressed(_ sender: Any) {
        if let url = URL(string: movieDetails?.url ?? "www.google.com") {
          UIApplication.shared.open(url)
        } else {
          print("url is not correct")
        }

    }
    
    // MARK: - Private Functions.
    
    func displayDataInTheView(){
        self.title = movieDetails?.titleEnglish
        self.movieYear.text = "\(movieDetails?.year ?? 2000)"
        self.movieGeners.text = movieDetails?.genres?.joined(separator: ", ")
        if movieDetails?.descriptionFull == "" {
            movieFullDescription.text = " This movie didn't have a Description , \n GOOGLE it if you need the Description"
        }else {
            self.movieFullDescription.text = movieDetails?.descriptionFull

        }
        watchBtn.setTitle(movieDetails?.url, for: .normal)
        guard let imgURL = URL(string: movieDetails?.backgroundImageOriginal ?? "" ) else { return  }
         let recource = ImageResource(downloadURL: imgURL)
        self.movieImage.kf.setImage(with: recource)
    }
    
    
}

// MARK: - <#UI.....#> Delegate & DataSource.
//
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


