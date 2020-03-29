import XCTest
@testable import Urolog
 
 
final class EndBasicTest: XCTestCase
{
    func testEndSeverity_With_SufficientMinimalSeverity()
    {
        let expectation =
            XCTestExpectation(description:
                """
                Text stream must be written only \
                if minimalSeverity of an \
                endpoint is sufficient.
                """
            )
        expectation.isInverted = true
        let ts = TsTest()
        ts.expectation = expectation
        
        let end = EndBasic(minimalSeverity: .info, textStream: ts)
        
        let event =
            Event.test(minimalSeverity: .debug)
        
        event.send(to: end, format: FmtDefault())
        
        wait(for: [expectation], timeout: 0.1)
    }
    
    
    func testEndSeverity_With_InsufficientMinimalSeverity()
    {
        let expectation =
            XCTestExpectation(description:
                """
                Text stream must be written only \
                if minimalSeverity of an \
                endpoint is sufficient.
                """
            )
        let ts = TsTest()
        ts.expectation = expectation
        
        let end = EndBasic(minimalSeverity: .info, textStream: ts)
        
        let event =
            Event.test(minimalSeverity: .info)
        
        event.send(to: end, format: FmtDefault())
        
        wait(for: [expectation], timeout: 0.1)
    }
    
    
    func testEndSeverityMute()
    {
        let expectation =
            XCTestExpectation(description:
                """
                Text stream must be written only \
                if an endpoint is unmuted.
                """
            )
        expectation.isInverted = true
        let ts = TsTest()
        ts.expectation = expectation
        
        let end = EndBasic(minimalSeverity: .info, textStream: ts)
        
        let event =
            Event.test(minimalSeverity: .info)
                
        end.mute()
        event.send(to: end, format: FmtDefault())
        
        wait(for: [expectation], timeout: 0.1)
    }
    
    
    func testEndSeverityUnmute_After_Mute()
    {
        let expectation =
            XCTestExpectation(description:
                """
                Text stream must be written only \
                if an endpoint is unmuted.
                """
            )
        let ts = TsTest()
        ts.expectation = expectation
        
        let end = EndBasic(minimalSeverity: .info, textStream: ts)
        
        let event =
            Event.test(minimalSeverity: .info)
        
        end.mute()
        event.send(to: end, format: FmtDefault())
        end.unmute()
        event.send(to: end, format: FmtDefault())
        
        wait(for: [expectation], timeout: 0.1)
    }
}




// MARK: - Test Additions
final class TsTest: TextStream
{
    // MARK: Test
    var expectation: XCTestExpectation?
    
    
    // MARK: TextStream
    func write(_ text: String)
    {
        expectation?.fulfill()
    }
}


extension Event
{
    static func test(minimalSeverity: Severity = .debug) -> Event
    {
        Event(
            severity: minimalSeverity
            , message: "Test Message"
            , context: Context.test
        )
    }
}

extension Context
{
    static var test: Context {
        Context(
            date: Date(timeIntervalSince1970: 1337)
            , lineNumber: 9
            , functionName: "Test Function Name"
            , filePath: "Test File Path"
            , threadName: "Test Thread Name"
            , isMainThread: true
        )
    }
}
