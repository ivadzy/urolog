import XCTest
@testable import Urolog
 
 
final class FrJSONTests: XCTestCase {
    func testJSONFormat() {
        let format = JSONFormat()
        let context =
            Context(
                  identifier: "Test Identifier"
                , date: Date(timeIntervalSince1970: 1337)
                , lineNumber: 9
                , functionName: "Test Function Name"
                , filePath: "Test File Path"
                , threadName: "Test Thread Name"
                , isMainThread: true
            )
        
        let result =
            format.format(
                severity: .debug
                , message: "Test Message"
                , context: context
            )
        
        let expected =
        """
        {"severity": "debug", "message": "Test Message", "context": \
        {"date": "\(Date(timeIntervalSince1970: 1337))", \
        "lineNumber": 9, \
        "functionName": "Test Function Name", \
        "filePath": "Test File Path", \
        "threadName": "Test Thread Name", \
        "isMainThread": true}}
        """
        XCTAssertEqual(result, expected)
    }
}
