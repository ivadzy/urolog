import Foundation


public final class Urolog
{
    public static let defaultEndpoint =
        ConsoleEndpoint.self
    
    // MARK: - Initialization
    private let endpoints: [Endpoint]
    public init(
        endpoints: [Endpoint] = [Urolog.defaultEndpoint.init()]
    )
    {
        self.endpoints = endpoints
    }
}




// MARK: - Public
public extension Urolog
{
    func debug(
          _ message: String
        , _ file: String = #file
        , _ line: Int = #line
        , _ function: String = #function
    )
    {
        let context =
            Context(
                  severity: .debug
                , message: message
                , date: Date()
                , lineNumber: line
                , functionName: function
                , filePath: file
                , threadName: Thread.current.name ?? Constants.blankFiller
                , isMainThread: Thread.isMainThread
            )
            
        send(context, endpoints: endpoints)
    }
    
    
    func info(
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
                , lineNumber: line
                , functionName: function
                , filePath: file
                , threadName: Thread.current.name ?? Constants.blankFiller
                , isMainThread: Thread.isMainThread
            )
        
        send(context, endpoints: endpoints)
    }
    
    
    func warn(
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
                , lineNumber: line
                , functionName: function
                , filePath: file
                , threadName: Thread.current.name ?? Constants.blankFiller
                , isMainThread: Thread.isMainThread
            )
            
        send(context, endpoints: endpoints)
    }
    
    
    func error(
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
                , lineNumber: line
                , functionName: function
                , filePath: file
                , threadName: Thread.current.name ?? Constants.blankFiller
                , isMainThread: Thread.isMainThread
            )
            
        send(context, endpoints: endpoints)
    }
}




// MARK: - Private
private extension Urolog
{
    func send(
        _ context: Context
        , endpoints: [Endpoint]
    )
    {
        endpoints.forEach({ $0.send(context) })
    }
}
