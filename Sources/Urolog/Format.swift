import Foundation

public class Format<T>
{
    open func format(
        severity: Severity
        , message: String
        , context: Context
    )
        -> T
    {
      fatalError("Not implemented")
    }
    
    
    open func format(
        date: Date
        , lineNumber: Int
        , functionName: String
        , filePath: String
        , threadName: String
        , isMainThread: Bool
    )
        -> T
    {
        fatalError("Not implemented")
    }
}





