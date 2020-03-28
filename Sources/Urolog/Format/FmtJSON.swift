import Foundation

public final class FmtJSON: Format<String>
{
    override public func format(
        severity: Severity
        , message: String
        , context: Context
    )
        -> String
    {
        let ctxFormat =
            format(
                date: context.date
                , lineNumber: context.lineNumber
                , functionName: context.functionName
                , filePath: context.filePath
                , threadName: context.threadName
                , isMainThread: context.isMainThread
            )
            
        return
            """
            {"severity": "\(severity.description)", "message": "\(message)", "context": \(ctxFormat)}
            """
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
        return
            """
            {"date": "\(date)", "lineNumber": \(lineNumber), "functionName": "\(functionName)", "filePath": "\(filePath)", "threadName": "\(threadName)", "isMainThread": \(isMainThread.description)}
            """
    }
}
