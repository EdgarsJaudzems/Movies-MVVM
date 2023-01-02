//
//  DetailsViewModelTests.swift
//  Movies MVVMTests
//
//  Created by edgars.jaudzems on 02/01/2023.
//

import XCTest
@testable import Movies_MVVM

final class DetailsViewModelTests: XCTestCase {

    var mainViewModel: MainViewModel!
    var detailsViewModel: DetailsViewModel!
    var mockNetworkManager: MockNetworkManager!

    override func setUp() {
        super.setUp()
        mainViewModel = MainViewModel()
        mockNetworkManager = MockNetworkManager()
        mainViewModel = MainViewModel(networkManager: mockNetworkManager)
    }

    override func tearDown() {
        super.tearDown()
        detailsViewModel = nil
        mainViewModel = nil
        mockNetworkManager = nil
    }
    
    func testForMovieDetailsData() {
        let movieId = 106541
        
        mainViewModel.getTrendingMovies()
        let movie = mainViewModel.retrieveMovie(with: movieId)
        detailsViewModel = DetailsViewModel(movie: movie!)
        
        // Expected
        XCTAssertEqual(detailsViewModel.id, movie?.id, "ID should be same")
        XCTAssertEqual(detailsViewModel.title, movie?.name, "Title should be same")
        XCTAssertEqual(detailsViewModel.description, movie?.overview, "Description should be same")
    }
}
