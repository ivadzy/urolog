import Foundation

private struct Constants
{
    static let defaultProperty = "-"
}

public final class Urolog
{
    public static let defaultEndpoint = ConsoleEndpoint.self
    
    // MARK: Initialization
    private let endpoints: [Endpoint]
    public init(
        endpoints: [Endpoint] = [Urolog.defaultEndpoint.init()]
    )
    {
        self.endpoints = endpoints
    }
}


// MARK: - Private
extension Urolog
{
    private func send(
        _ context: Context
        , endpoints: [Endpoint]
    )
    {
        for endpoint in endpoints
        {
            endpoint.send(context)
        }
    }
}

// MARK: - Public
extension Urolog
{
    public func debug(
        _ message: String
        , _ file: String = #file
        ,  _ line: Int = #line
        , _ function: String = #function
        )
    {
        let context =
            Context(
                severity: .debug
                , message: message
                , date: Date()
                , functionName: function
                , filePath: file
                , lineNumber: line
                , threadName: Thread.current.name ?? Constants.defaultProperty
                , isMainThread: Thread.isMainThread
        )
        send(context, endpoints: endpoints)
    }
    
    public func info(
        _ message: String
        , _ file: String = #file
        ,  _ line: Int = #line
        , _ function: String = #function
        )
    {
        let context =
            Context(
                severity: .info
                , message: message
                , date: Date()
                , functionName: function
                , filePath: file
                , lineNumber: line
                , threadName: Thread.current.name ?? Constants.defaultProperty
                , isMainThread: Thread.isMainThread
        )
        send(context, endpoints: endpoints)
    }
    
    public func warn(
        _ message: String
        , _ file: String = #file
        ,  _ line: Int = #line
        , _ function: String = #function
    )
    {
        let context =
            Context(
                severity: .warning
                , message: message
                , date: Date()
                , functionName: function
                , filePath: file
                , lineNumber: line
                , threadName: Thread.current.name ?? Constants.defaultProperty
                , isMainThread: Thread.isMainThread
            )
        send(context, endpoints: endpoints)
    }
    
    public func error(
        _ message: String
        , _ file: String = #file
        ,  _ line: Int = #line
        , _ function: String = #function
        )
    {
        let context =
            Context(
                severity: .error
                , message: message
                , date: Date()
                , functionName: function
                , filePath: file
                , lineNumber: line
                , threadName: Thread.current.name ?? Constants.defaultProperty
                , isMainThread: Thread.isMainThread
            )
        send(context, endpoints: endpoints)
    }
}

