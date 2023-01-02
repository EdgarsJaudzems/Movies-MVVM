//
//  MainViewModelTests.swift
//  Movies MVVMTests
//
//  Created by edgars.jaudzems on 30/12/2022.
//

import XCTest
@testable import Movies_MVVM

final class MainViewModelTests: XCTestCase {

    var mainViewModel: MainViewModel!
    var mockNetworkManager: MockNetworkManager!
    
    override func setUp() {
        super.setUp()
        mainViewModel = MainViewModel()
        mockNetworkManager = MockNetworkManager()
        mainViewModel = MainViewModel(networkManager: mockNetworkManager)
    }
    
    override func tearDown() {
        super.tearDown()
        mainViewModel = nil
        mockNetworkManager = nil
    }

    func testGetTrendingMovies() {
        let expectation = XCTestExpectation(description: "Expected to fetch movies")
        
        mainViewModel.getTrendingMovies()
        expectation.fulfill()
        XCTAssertEqual(mainViewModel.cellDataSource.value?.count, 20)
        wait(for: [expectation], timeout: 2)
    }
    
    func testGetTrendingMoviesWithNoService() {
        mainViewModel.networkManager = nil
        let expectation = XCTestExpectation(description: "Expected no service for fetching")
        
        mainViewModel.getTrendingMovies()
        expectation.fulfill()
        XCTAssertEqual(mainViewModel.cellDataSource.value?.count, nil)
        wait(for: [expectation], timeout: 2)
    }
    
    func testFirstMovieTitle() {
        let movieTitle = "Glass Onion: A Knives Out Mystery"
        let expectation = XCTestExpectation(description: "Expected correct movie title")
        
        mainViewModel.getTrendingMovies()
        expectation.fulfill()
        XCTAssertEqual(mainViewModel.cellDataSource.value![0].title, movieTitle)
        wait(for: [expectation], timeout: 2)
    }
    
    func testNumberOfRowsInTableView() {
        let numberOfSectionsInTableView = 1
        let expectation = XCTestExpectation(description: "Expected number of rows should be same as movie count")
        
        mainViewModel.getTrendingMovies()
        expectation.fulfill()
        
        XCTAssertEqual(mainViewModel.numberOfRows(in: numberOfSectionsInTableView), 20)
        wait(for: [expectation], timeout: 2)
    }
    
    func testRetrieveMovie() {
        let movieId = 106541
        let expectedMovieTitle = "The Witcher: Blood Origin"
        let expectation = XCTestExpectation(description: "Expected to retrieve correct movie")
        
        mainViewModel.getTrendingMovies()
        expectation.fulfill()
        
        let movie = mainViewModel.retrieveMovie(with: movieId)
        
        XCTAssertEqual(movie!.name, expectedMovieTitle)
        wait(for: [expectation], timeout: 2)
    }
}
