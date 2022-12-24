//
//  DetailsViewController.swift
//  Movies MVVM
//
//  Created by edgars.jaudzems on 23/12/2022.
//

import UIKit
import SDWebImage

class DetailsViewController: UIViewController {

    // IBOutlets
    @IBOutlet weak var movieBackdrop: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    
    // ViewModel
    var viewModel: DetailsViewModel
    
    init(viewModel: DetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "DetailsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
    }
    
    func configView() {
        self.title = "Movie Details"
        
        movieTitle.text = viewModel.title
        movieDescription.text = viewModel.description
        movieBackdrop.sd_imageIndicator = SDWebImageActivityIndicator.gray
        movieBackdrop.sd_setImage(with: viewModel.backdropUrl)
    }
}
