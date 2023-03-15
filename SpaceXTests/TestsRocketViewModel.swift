//
//  TestsRocketViewModel.swift
//  SpaceXTests
//
//  Created by Алексей Ходаков on 09.03.2023.
//

import XCTest
import Combine
@testable import SpaceX

final class TestsRocketViewModel: XCTestCase {
    
    let service =  NetworkService()
    var viewModel: RocketViewModel?
    
    private var cancellables: Set<AnyCancellable> = []
    
    override func setUp() async throws {
        viewModel = RocketViewModel(service: service)
    }
    
    override func tearDown() async throws {
        viewModel = nil
    }
    
    func test_getImage() throws {
        let expectation = XCTestExpectation(description: "Get image")
        
        viewModel!.$image
            .debounce(for: 3, scheduler: RunLoop.main)
            .sink { image in
                XCTAssertNotNil(image)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        viewModel!.getImage(from: "https://farm5.staticflickr.com/4696/40126460511_b15bf84c85_b.jpg")
        
        wait(for: [expectation], timeout: 5)
    }
}

