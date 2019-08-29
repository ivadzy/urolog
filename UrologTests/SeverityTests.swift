//
//  SeverityTests.swift
//  UrologTests
//
//  Created by Ivan on 8/29/19.
//  Copyright © 2019 ivadzy. All rights reserved.
//

import XCTest
@testable import Urolog

class SeverityTests: XCTestCase
{
    func test_severityComparissons_should_beValid()
    {
        let description = "Severity should be valid"
        XCTAssert(Severity.debug <= Severity.info, description)
        XCTAssert(Severity.info <= Severity.warning, description)
        XCTAssert(Severity.warning <= Severity.error, description)
        XCTAssert(Severity.debug <= Severity.debug, description)
        XCTAssert(Severity.error <= Severity.error, description)
    }
   
}
