//
//  UIViewExtension.swift
//  Movies MVVM
//
//  Created by edgars.jaudzems on 20/12/2022.
//

import UIKit

extension UIView {
    func addRoundCorners(radius: CGFloat = 10) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func addBorder(color: UIColor, width: CGFloat) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
}
