import Foundation


public final class Urolog
{
    // MARK: - Initialisation
    public let endpoints: [Endpoint]
    
    public init(
        endpoints: [Endpoint] = [ConsoleEndpoint()]
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
        send(
            event(
                severity: .debug
                , message: message
                , file: file
                , line: line
                , function: function
            )
            , to: endpoints
        )
    }
    
    
    func info(
        _ message: String
        , _ file: String = #file
        , _ line: Int = #line
        , _ function: String = #function
    )
    {
        send(
            event(
                severity: .info
                , message: message
                , file: file
                , line: line
                , function: function
            )
            , to: endpoints
        )
    }
    
    
    func warn(
        _ message: String
        , _ file: String = #file
        , _ line: Int = #line
        , _ function: String = #function
    )
    {
        send(
            event(
                severity: .warning
                , message: message
                , file: file
                , line: line
                , function: function
            )
            , to: endpoints
        )
    }
    
    
    func error(
        _ message: String
        , _ file: String = #file
        , _ line: Int = #line
        , _ function: String = #function
    )
    {
        send(
            event(
                severity: .error
                , message: message
                , file: file
                , line: line
                , function: function
            )
            , to: endpoints
        )
    }
}




// MARK: - Private
private extension Urolog
{
    func event(
        severity: Severity
        , message: String
        , file: String
        , line: Int
        , function: String
    )
        -> Event
    {
        let context =
            Context(
                date: .init()
                , lineNumber: line
                , functionName: function
                , filePath: file
                , threadName: Thread.current.name ?? ""
                , isMainThread: Thread.current.isMainThread
        )
        
        return Event(
            severity: severity
            , message: message
            , context: context
        )
    }
    
    
    func send(_ event: Event, to endpoints: [Endpoint])
    {
        endpoints.forEach {
            event.send(to: $0, format: $0.preferredFormat)
        }
    }
}
