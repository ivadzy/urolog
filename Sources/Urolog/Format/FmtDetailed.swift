import Foundation


public final class FmtDetailed: Format<String>
{
    override public func format(
        severity: Severity
        , message: String
        , context: Context
    )
        -> String
    {
        return [
            "\(context.date)"
            , "[\(severity.description)]"
            , "[\(context.filePath)]"
            , "[\(context.functionName)]"
            , "\(message)"
            ].joined(separator: " - ") + "\n"
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
