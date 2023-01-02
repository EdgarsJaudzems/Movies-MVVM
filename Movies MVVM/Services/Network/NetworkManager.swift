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
    case custom(string: String)
}

protocol NetworkManagerProtocol: AnyObject {
    func getTrendingMovies(urlString: String, completionHandler: @escaping (_ movieResult: Result<TrendingMoviesModel,NetworkError>) -> Void)
}

public class NetworkManager: NetworkManagerProtocol {
    static let shared = NetworkManager()
    
    let urlString = "\(NetworkConstants.shared.baseUrl)trending/all/day?api_key=\(NetworkConstants.shared.apiKey)"
    
    func getTrendingMovies(urlString: String, completionHandler: @escaping (_ movieResult: Result<TrendingMoviesModel,NetworkError>) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completionHandler(Result.failure(.urlError))
            return
        }
        print(url)
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
            
            if error == nil,
               let data = dataResponse,
               let movieData = try? JSONDecoder().decode(TrendingMoviesModel.self, from: data) {
                print("ℹ️ Network Manager: \(movieData.results.count)")
                completionHandler(.success(movieData))
            } else {
                print("❌ Error: \(error.debugDescription)")
                completionHandler(.failure(.errorParsingData))
                
            }
        }.resume()
    }
}
