import Foundation

public final class ClosureFormat: Format<String>
{
    // MARK: - Intialisation
    public typealias Handler = (Severity, String, Context) -> String
    
    private let handler: Handler
    
    public init(_ handler: @escaping Handler)
    {
        self.handler = handler
    }
    
    
    
    
    // MARK: Format
    override public func format(
        severity: Severity
        , message: String
        , context: Context
    )
        -> String
    {
        return handler(severity, message, context)
    }
    
    
    override public func format(
        date: Date
        , lineNumber: Int
        , functionName: String
        , filePath: String
        , threadName: String
        , isMainThread: Bool
    )
        -> String
    {
        fatalError("Not implemented")
    }
}
