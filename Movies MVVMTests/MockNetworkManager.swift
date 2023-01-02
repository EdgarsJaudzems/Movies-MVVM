//
//  MockNetworkManager.swift
//  Movies MVVMTests
//
//  Created by edgars.jaudzems on 30/12/2022.
//

import Foundation
@testable import Movies_MVVM

class MockNetworkManager: NetworkManagerProtocol {
    func getTrendingMovies(urlString: String, completionHandler: @escaping (Result<TrendingMoviesModel, NetworkError>) -> Void) {
        let result = SwiftUtility().loadJson(filename: "movies")
        
        if (result != nil) {
            completionHandler(.success(result!))
        } else {
            completionHandler(.failure(.errorParsingData))
        }
    }
}
