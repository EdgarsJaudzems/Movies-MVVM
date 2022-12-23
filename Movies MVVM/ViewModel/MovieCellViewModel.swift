//
//  MovieCellViewModel.swift
//  Movies MVVM
//
//  Created by edgars.jaudzems on 20/12/2022.
//

import Foundation

class MovieCellViewModel {
    
    var title: String
    var year: String
    var rating: String
    var posterUrl: URL?
    
    init(movie: Movie) {
        self.title = movie.title ?? movie.name ?? ""
        self.year = movie.releaseDate ?? movie.firstAirDate ?? ""
        self.rating = "\(movie.voteAverage)"
        self.posterUrl = getPosterUrlFromString(movie.posterPath)
    }
    
    private func getPosterUrlFromString(_ posterPath: String) -> URL? {
        URL(string: "\(NetworkConstants.shared.posterBaseUrl)\(posterPath)")
    }
}
