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
    
    // Protocol
    var networkManager: NetworkManagerProtocol!
    
    init(networkManager: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }
    
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
        
        self.networkManager.getTrendingMovies(urlString: NetworkManager.shared.urlString, completionHandler: { [weak self] movieResult in
            self?.isLoading.value = false
            
            switch movieResult {
            case.success(let movieData):
                print("ℹ️ MainViewModel: \(movieData.results.count)")
                self?.dataSource = movieData
                self?.getCellData()
            case.failure(let error):
                print("❌ Error: \(error)")
            }
        })
    }
    
    func getCellData() {
        self.cellDataSource.value = self.dataSource?.results.compactMap({MovieCellViewModel(movie: $0)})
    }
    
    func getMovieTitle(_ movie: Movie) -> String {
        return movie.title ?? movie.name ?? ""
    }
    
    func retrieveMovie(with id: Int) -> Movie?{
        guard let movie = dataSource?.results.first(where: {
            $0.id == id
        }) else {
            return nil
        }
        return movie
    }
}
