//
//  NetworkConstant.swift
//  Movies MVVM
//
//  Created by edgars.jaudzems on 18/12/2022.
//

import Foundation

class NetworkConstant {
    public static var shared: NetworkConstant = NetworkConstant()
    
    private init() {
        // Singletone
    }
    
    public var baseUrl: String {
        get {
            return "https://api.themoviedb.org/3/"
        }
    }
    
    public var apiKey: String {
        get {
            return "9ca86244732b6e729d3bea64447a56d7"
        }
    }
    
    public var moviePosterPath: String {
        get {
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
}
