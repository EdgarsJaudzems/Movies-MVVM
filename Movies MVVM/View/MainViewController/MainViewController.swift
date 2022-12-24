//
//  MainViewController.swift
//  Movies MVVM
//
//  Created by edgars.jaudzems on 18/12/2022.
//

import UIKit

class MainViewController: UIViewController {

    // IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // ViewModel
    var viewModel: MainViewModel = MainViewModel()
    
    // DataSource
    var cellDataSource: [MovieCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
        bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getTrendingMovies()
    }
    
    // Configuring MainViewController (View)
    func configView() {
        self.title = Constants.appName
        
        setupTableView()
    }
    
    // Binding (listener)
    func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self,
                    let isLoading = isLoading else {
                return // if nil, do nothing
            }
            
            DispatchQueue.main.async {
                if isLoading {
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                }
            }
        }
        
        viewModel.cellDataSource.bind { [weak self] movies in
            guard let self = self,
                  let movies = movies else {
                return
            }
            self.cellDataSource = movies
            self.reloadTableView()
        }
    }
    
    func openDetailsScreen(movieId: Int) {
        guard let movie = viewModel.retrieveMovie(with: movieId) else  { return }
        
        let detailsViewModel = DetailsViewModel(movie: movie)
        let detailsViewController = DetailsViewController(viewModel: detailsViewModel)
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(detailsViewController, animated: true)
        }
    }
}
