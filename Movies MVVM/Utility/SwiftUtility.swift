//
//  SwiftUtility.swift
//  Movies MVVM
//
//  Created by edgars.jaudzems on 31/12/2022.
//

import Foundation

struct SwiftUtility {
    func loadJson(filename fileName: String) -> TrendingMoviesModel? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(TrendingMoviesModel.self, from: data)
                print(jsonData)
                return jsonData
            } catch {
                print("❌ Error: \(error)")
            }
        }
        return nil
    }
}
