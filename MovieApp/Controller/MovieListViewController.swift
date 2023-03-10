//
//  ViewController.swift
//  MovieApp
//
//  Created by Mohamed Hadwa on 06/03/2023.
//

import UIKit
import Alamofire
public let url = URL(string:"https://yts.mx/api/v2/list_movies.json")!

class MovieListViewController: UIViewController {
    // MARK: - IBOutlets.
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Private Variables.
    var movies : [Movie]?
    var page = 1
    let searchController = UISearchController(searchResultsController: nil)
    var filteredMovies :[Movie] = []
    var shownIndexes : [IndexPath] = []
    let CELL_HEIGHT : CGFloat = 40


    private var finishedLoadingInitialTableCells = false

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search in Movies"
        searchController.searchResultsUpdater = self
        getData()
        
    }
    // MARK: - IBActions.
    
    
    // MARK: - Private Functions.
    
    
    func getData(){
        //        URLSession.shared.dataTask(with: url) { (data, response, error) in
        //            guard let data = data , error == nil else{return}
        //
        //            var result :Movies?
        //            do{
        //              result = try JSONDecoder().decode(Movies.self, from: data)
        //            }catch{
        //                print(error)
        //            }
        //            guard let finalResult = result else{return}
        //
        //            self.movies.append( contentsOf: finalResult.data.movies)
        //            print(finalResult.genres?.first)
        //        }.resume()
        
        AF.request(url,method: .get,encoding:JSONEncoding.default).responseDecodable(of: Movies.self) { (response) in
            guard let data = response.data else {return}
             let res = try? JSONDecoder().decode(Movies.self, from: data)
            self.movies = res?.data?.movies ?? [Movie()]
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}


// MARK: - MovieListViewController Delegate & DataSource.

extension MovieListViewController : UITableViewDelegate , UITableViewDataSource ,UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filteredMovies = movies?.filter({ (movie) ->Bool in
            return movie.title? .lowercased().contains(searchController.searchBar.text!.lowercased()) ?? true
        }) ?? [Movie()]
        tableView.reloadData()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return searchController.isActive ? filteredMovies.count : movies?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell",for: indexPath) as! MovieListTableViewCell
       cell.configure(with: searchController.isActive ? filteredMovies[indexPath.row] : movies?[indexPath.row] ?? Movie())
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = storyboard?.instantiateViewController(withIdentifier: "details") as! DetailsViewController
        
   //     vc.getData()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
       
        cell.alpha = 0
                cell.transform = CGAffineTransform(translationX: 0, y:cell.contentView.frame.width)
        UIView.animate(withDuration: 0.5, delay: 0.1*Double(indexPath.row), animations: {
                    cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y: cell.contentView.frame.height)
                    cell.alpha = 1
                })
    }
}
// MARK: - APi.

extension MovieListViewController {

}



