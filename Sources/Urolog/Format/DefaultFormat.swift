import Foundation


public final class DefaultFormat: Format<String>
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
