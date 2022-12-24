//
//  DetailsViewModel.swift
//  Movies MVVM
//
//  Created by edgars.jaudzems on 23/12/2022.
//

import Foundation

class DetailsViewModel {
    
    var movie: Movie
    
    var id: Int
    var title: String
    var description: String
    var backdropUrl: URL?
    
    init(movie: Movie) {
        self.movie = movie
        
        self.id = movie.id
        self.title = movie.title ?? movie.name ?? ""
        self.description = movie.overview
        self.backdropUrl = getPosterUrlFromString(movie.backdropPath)
    }
    
    private func getPosterUrlFromString(_ backdropPath: String) -> URL? {
        URL(string: "\(NetworkConstants.shared.posterBaseUrl)\(backdropPath)")
    }
}
