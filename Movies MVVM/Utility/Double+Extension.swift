//
//  Double.swift
//  Movies MVVM
//
//  Created by edgars.jaudzems on 24/12/2022.
//

import Foundation

extension Double {
    func formatRating() -> String {
        return String(format: "%.1f", self)
    }
}
