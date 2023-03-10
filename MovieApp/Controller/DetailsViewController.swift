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
    
    @IBOutlet weak var movieName: UILabel!
    
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieGeners: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieFullDescription: UILabel!
    
    @IBOutlet weak var movieLink: UILabel!
    // MARK: - Private Variables.
    var movieDetails: Movie?

    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        getData()
    }
    // MARK: - IBActions.
    
    
    // MARK: - Private Functions.
    
    func getData(){
//        AF.request(url,method: .get,encoding:JSONEncoding.default).responseDecodable(of: Movies.self) { (response) in
//            //print(response)
//            guard let data = response.data else {return}
//            guard let res = try? JSONDecoder().decode(Movies.self, from: data) else {return}
//            configure(with: res.data?.movies)
//        }
        AF.request(url,method: .get,encoding:JSONEncoding.default).responseDecodable(of: Movie.self) { (response) in
            guard let data = response.data else {return}
             let res = try? JSONDecoder().decode(Movie.self, from: data)
            self.movieDetails = res
          //  self.configure(with: res!)
            self.displayDataInTheView()
            print(self.movieDetails?.genres)
        }
        
    }
    func configure(with data: Movie){
        self.movieName.text = data.title
        self.movieYear.text = "\( data.year ?? 2000)"
        self.movieFullDescription.text = data.descriptionFull
        self.movieGeners.text = data.genres?.joined(separator: ", ")
        guard let imgURL = URL(string: data.largeCoverImage ?? "") else { return  }
        let recource = ImageResource(downloadURL: imgURL)
        self.movieImage.kf.setImage(with: recource)
        

    }
    func displayDataInTheView(){
        self.title = movieDetails?.title
        self.movieYear.text = "\(movieDetails?.year ?? 2000)"
        self.movieGeners.text = movieDetails?.genres?.joined(separator: ", ")
        self.movieFullDescription.text = movieDetails?.descriptionFull
        self.movieLink.text = movieDetails?.url
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


