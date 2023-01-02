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
    }

    func testGetTrendingMovies() {
        let expectation = XCTestExpectation(description: "Fetched movies")
        mainViewModel.getTrendingMovies()
        expectation.fulfill()
        XCTAssertEqual(mainViewModel.cellDataSource.value?.count, 20)
        wait(for: [expectation], timeout: 2)
    }
}
