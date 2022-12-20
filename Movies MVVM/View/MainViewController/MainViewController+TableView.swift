//
//  MainViewController+TableView.swift
//  Movies MVVM
//
//  Created by edgars.jaudzems on 18/12/2022.
//

import Foundation
import UIKit

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    // Setup
    func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        registerCells()
    }
    
    // TableView Cell
    func registerCells() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.singleMovieTableViewCell)
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    // TableView DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.singleMovieTableViewCell, for: indexPath)
        let movieData = cellDataSource[indexPath.row]
        cell.textLabel?.text = self.viewModel.getMovieTitle(movieData)
        return cell
    }
}
