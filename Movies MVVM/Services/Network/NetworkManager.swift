//
//  NetworkManager.swift
//  Movies MVVM
//
//  Created by edgars.jaudzems on 18/12/2022.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case errorParsingData
}

public class NetworkManager {
    
    static func getTrendingMovies(completionHandler: @escaping (_ movieResult: Result<TrendingMoviesModel,NetworkError>) -> Void) {
        
        let urlString = "\(NetworkConstants.shared.baseUrl)trending/all/day?api_key=\(NetworkConstants.shared.apiKey)"
        
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
            if error == nil,
               let data = dataResponse,
               let movieData = try? JSONDecoder().decode(TrendingMoviesModel.self, from: data) {
                completionHandler(.success(movieData))
            } else {
                completionHandler(.failure(.errorParsingData))
            }
        }.resume()
    }
}
