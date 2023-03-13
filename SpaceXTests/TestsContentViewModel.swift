//
//  SpaceXTests.swift
//  SpaceXTests
//
//  Created by Алексей Ходаков on 28.02.2023.
//

import XCTest
import Combine
@testable import SpaceX

final class TestsContentViewModel: XCTestCase {
    
    let service = NetworkService()
    var viewModel: ContentViewModel?
    
    private var cancellables: Set<AnyCancellable> = []
    
    override func setUp() async throws {
        viewModel = ContentViewModel(service: service)
    }
    
    override func tearDown() async throws {
        viewModel = nil
    }
    
    func test_getRockets() throws {
        let expectation = XCTestExpectation(description: "Get rockets")
        
        viewModel!.$rockets.sink(receiveValue: { rockets in
            print(rockets)
            XCTAssertNotNil(rockets)
            expectation.fulfill()
        })
        .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 5)
    }
    
    func test_getLaunches() throws {
        let expectation = XCTestExpectation(description: "Get launches")
        
        viewModel!.$launchs
            .sink { launchs in
                XCTAssertNotNil(launchs)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 5)
    }
    
    func test_getIngex() throws {
        let index = viewModel!.getIngex(offset: 300, width: 350)
        XCTAssertTrue(index == 1)
    }
}

