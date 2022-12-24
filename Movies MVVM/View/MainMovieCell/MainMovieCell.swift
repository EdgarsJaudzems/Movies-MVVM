//
//  MainMovieCell.swift
//  Movies MVVM
//
//  Created by edgars.jaudzems on 20/12/2022.
//

import UIKit
import SDWebImage

class MainMovieCell: UITableViewCell {
    
    public static var identifier: String {
        get {
            return "MainMovieCell"
        }
    }
    
    public static func register() -> UINib {
        UINib(nibName: "MainMovieCell", bundle: nil)
    }

    // IBOutlets
    @IBOutlet weak var movieBackgroundLayer: UIView!
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieReleaseYear: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        moviePoster.addRoundCorners(radius: 5)
    }
    
    func setupCellData(viewModel: MovieCellViewModel) {
        self.movieTitle.text = viewModel.title
        self.movieReleaseYear.text = viewModel.year
        self.movieRating.text = viewModel.rating
        self.moviePoster.sd_setImage(with: viewModel.posterUrl)
    }
}
