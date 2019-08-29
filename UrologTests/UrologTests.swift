//
//  UrologTests.swift
//  UrologTests
//
//  Created by Ivan on 8/29/19.
//  Copyright © 2019 ivadzy. All rights reserved.
//

import XCTest
import os
@testable import Urolog

class UrologTests: XCTestCase
{
    func test_logControllerInstanceCreation_resultsNotNil()
    {
        let result = Urolog()
        XCTAssertNotNil(result)
    }
    
    func test_logController_printsMessagesToConsole()
    {
        let mockedEndpoint = MockConsoleEndpoint()
        let log = Urolog(endpoints: [mockedEndpoint])
        log.info("test entry")
        XCTAssert(mockedEndpoint.expectation, "`send` must be called after sending a message")
    }
    
    func test_logControllerDifferentLevelsOfMessage_shouldBePrinted()
    {
        let mockedEndpoint = MockConsoleEndpoint()
        let log = Urolog(endpoints: [mockedEndpoint])
        
        log.debug(Constants.defaultMessage)
        
        XCTAssert(mockedEndpoint.expectation, "Message should be printed to console")
    }
    
    func test_logController_addMultipleEndpoints()
    {
        let mockedEndpoint1 = MockConsoleEndpoint()
        let mockedEndpoint2 = MockConsoleEndpoint()
        let log = Urolog(endpoints: [mockedEndpoint1, mockedEndpoint2])
        
        log.info(Constants.defaultMessage)
        
        XCTAssert(mockedEndpoint1.expectation)
        XCTAssert(mockedEndpoint2.expectation)
    }
    
    func test_endpointMinimalSeverity_shouldFilterOutEntriesWithLessImportantSeverityLevel()
    {
        let mockedTarget = MockedTarget()
        let mockedEndpoint = ConsoleEndpoint(minimalSeverity: .info, writer: mockedTarget)
        let log = Urolog(endpoints: [mockedEndpoint])
        
        log.debug(Constants.defaultMessage)
        
        XCTAssertFalse(mockedTarget.expectation, "Endpoint with minimal severity == .information must not print debug entry")
    }
    
    // MARK: Format
    
    func test_logFormats()
    {
        let format = Format { context -> String in
            return "isMainThread: \(context.isMainThread)"
        }
        
        let target = MockedTarget()
        
        let endpoint = ConsoleEndpoint(format: format, writer: target)
        let log = Urolog(endpoints: [endpoint])
        log.debug(Constants.defaultMessage)
        
        XCTAssertEqual(target.lastEntry, "isMainThread: true")
    }
    
    func test_defaultFormat()
    {
        let log = Urolog()
        log.debug("Hello world")
    }
    
    func test_fileTarget()
    {
        let tempDirectoryPath = NSTemporaryDirectory()
        let tempDirectoryUrl = URL(fileURLWithPath: tempDirectoryPath).appendingPathComponent("test.log")
        let fileEndpoint = try! FileEndpoint(fileAtPath: LogFileAtPath(tempDirectoryUrl))
        
        let log = Urolog(endpoints: [fileEndpoint])
        
        log.info("Hello World")
        
    }
    
    func test_asyncFileWriter()
    {
        let tempFileUrl =
            URL(fileURLWithPath: NSTemporaryDirectory())
                .appendingPathComponent("test.log")
        
        let asyncFileEndpoint =
            try! AsyncFileEndpoint(
                fileAtPath: LogFileAtPath(tempFileUrl)
            )
        let urolog =
            Urolog(endpoints: [asyncFileEndpoint])
        
        urolog.debug("Hello")
        urolog.info("wow")
        urolog.error("error wow")
    }
}

// MARK: - Constants, Stubbed Data

struct Constants
{
    static let defaultMessage = "test message"
}

// MARK: - Mocks & Stubs

class MockedTarget: Writer
{
    var expectation: Bool = false
    var lastEntry: String?
    
    func write(_ entry: String)
    {
        expectation = true
        lastEntry = entry
    }
}

class MockConsoleEndpoint: Endpoint
{
    var expectation: Bool = false
    
    var minimalSeverity: Severity = .debug
    var format: FormatProtocol = DefaultFormat()
    var writer: Writer = ConsoleWriter()
    
    func send(_ context: Context)
    {
        expectation = true
    }
}
