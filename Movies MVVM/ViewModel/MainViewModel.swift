//
//  MainViewModel.swift
//  Movies MVVM
//
//  Created by edgars.jaudzems on 18/12/2022.
//

import Foundation

class MainViewModel {
    
    // Observables
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[MovieCellViewModel]> = Observable(nil)
    
    // Model
    var dataSource: TrendingMoviesModel?
    
    
    // Func
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRows(in section: Int) -> Int {
        self.dataSource?.results.count ?? 0
    }
    
    func getTrendingMovies() {
        if isLoading.value ?? true {
            return
        }
        isLoading.value = true
        
        NetworkManager.getTrendingMovies { [weak self] movieResult in
            self?.isLoading.value = false
            
            switch movieResult {
            case.success(let movieData):
                print("Top trending counts: \(movieData.results.count)")
                self?.dataSource = movieData
                self?.getCellData()
            case.failure(let error):
                print(error)
            }
        }
    }
    
    func getCellData() {
        self.cellDataSource.value = self.dataSource?.results.compactMap({MovieCellViewModel(movie: $0)})
    }
    
    func getMovieTitle(_ movie: Movie) -> String {
        return movie.title ?? movie.name ?? ""
    }
}
