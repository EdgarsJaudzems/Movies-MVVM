//
//  MainViewModel.swift
//  Movies MVVM
//
//  Created by edgars.jaudzems on 18/12/2022.
//

import Foundation

class MainViewModel {
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return 3
    }
    
    func getTrendingMovies() {
        NetworkManager.getTrendingMovies { movieResult in
            switch movieResult {
            case.success(let movieData):
                print("Top trending counts: \(movieData.results.count)")
            case.failure(let error):
                print(error)
            }
        }
    }
}
