import XCTest
@testable import Urolog
 
 
final class FrJSONTest: XCTestCase {
    func testJSONFormat() {
        let format = FmtJSON()
        let context =
            Context(
                date: Date(timeIntervalSince1970: 1337)
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
