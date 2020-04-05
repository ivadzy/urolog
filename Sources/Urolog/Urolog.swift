import Foundation


public final class Urolog
{
    // MARK: - Initialisation
    private var endpoints: [String: Endpoint]
    
    public init(
        endpoints: [String: Endpoint] = ["com.urolog.default" : ConsoleEndpoint()]
    )
    {
        self.endpoints = endpoints
    }
}




// MARK: - Public
public extension Urolog
{
    func register(_ endpoint: Endpoint, with identifier: String)
    {
        guard endpoints[identifier] != nil
        else {
            return
        }
        
        endpoints[identifier] = endpoint
    }
    
    
    func endpoint(with identifier: String) -> Endpoint?
    {
        endpoints[identifier]
    }
    
    
    func debug(
        _ message: String
        , _ file: String = #file
        , _ line: Int = #line
        , _ function: String = #function
    )
    {
        send(
            severity: .debug
            , message: message
            , file: file
            , line: line
            , function: function
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
            severity: .info
            , message: message
            , file: file
            , line: line
            , function: function
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
            severity: .warning
            , message: message
            , file: file
            , line: line
            , function: function
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
            severity: .error
            , message: message
            , file: file
            , line: line
            , function: function
            , to: endpoints
        )
    }
}




// MARK: - Private
private extension Urolog
{
    func send(
        severity: Severity
        , message: String
        , file: String
        , line: Int
        , function: String
        , to endpoints: [String: Endpoint]
    )
    {
        endpoints.forEach {
            let (identifier, endpoint) = $0
            
            let context =
                Context(
                    identifier: identifier
                    , date: .init()
                    , lineNumber: line
                    , functionName: function
                    , filePath: file
                    , threadName: Thread.current.name ?? ""
                    , isMainThread: Thread.current.isMainThread
            )
            
            let event =
                Event(
                    severity: severity
                    , message: message
                    , context: context
            )
            
            event.send(to: endpoint, format: endpoint.preferredFormat)
        }
    }
}
