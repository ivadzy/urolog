//
//  UrologTests.swift
//  UrologTests
//
//  Created by Ivan on 8/29/19.
//  Copyright © 2019 ivadzy. All rights reserved.
//

import XCTest
@testable import Urolog

class UrologTests: XCTestCase
{
    func test_logControllerInstanceCreation_resultsNotNil()
    {
        let result = LogController()
        XCTAssertNotNil(result)
    }
    
    func test_logController_printsMessagesToConsole()
    {
        
    }
}
