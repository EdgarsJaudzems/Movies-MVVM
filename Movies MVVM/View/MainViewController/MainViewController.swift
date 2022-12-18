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
    
    // ViewModel
    var viewModel: MainViewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.getTrendingMovies()
    }
    
    // Configuring MainViewController (View)
    func configView() {
        self.title = Constants.appName
        
        setupTableView()
    }
}
