//
//  PaginationHandler.swift
//  MovieApp
//
//  Created by Mohamed Hadwa on 11/03/2023.
//

import Foundation


class MoviesPageWithPagination{
        
    // api
    var totaItemsCountFromApi = 0
    var innerList: [Movie] = []{
        didSet{
            guard let table = controller.tableView else{ return}
            controller.tableView.reloadData()
        }
    }
    
    // fetching
    var currentPageNum = 1
    var isFetching = false
   
    weak var controller: MovieListViewController!
    
    init(controller: MovieListViewController!){
        self.controller = controller
    }

    func getData(){
        controller.getData(currentPageNum)
    }
    
    
    // api
    func passListAndItemTotalFromApi(list: [Movie], totalFavsFromApi: Int?){
        
        innerList.append(contentsOf: list)
        
        if let total = totalFavsFromApi,
           total > self.innerList.count{
            totaItemsCountFromApi = total
            
            currentPageNum += 1
            
            isFetching = false
        }
    }
    
    // fetching
    func startFetchingOrNot(indexRow: Int){
        if indexRow >= innerList.count - 1 && !isFetching && (totaItemsCountFromApi > innerList.count) {
            isFetching = true
            getData()
        }
    }
}
