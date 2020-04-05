import Foundation


public final class AsyncFileEndpoint: Endpoint
{
    // MARK: - Initialisation
    private let origin: Endpoint
    
    init(_ origin: Endpoint)
    {
        self.origin = origin
    }
    
    
    
    
    // MARK: - Public
    public var preferredFormat: Format<String> = DefaultFormat()
    
    public var identifier: String = "com.urolog.endpoint.async"
}




// MARK: - Public
public extension AsyncFileEndpoint
{
    // MARK: Initialisation
    convenience init(
          minimalSeverity: Severity
        , file: FileWithHandle
        , queue: DispatchQueue
    )
        throws
    {
        let handle = try file.fileHandle()
        let textStream = AsyncFileTextStream(handle: handle, queue: queue)
        
        self.init(
            BasicEndpoint(
                  minimalSeverity: minimalSeverity
                , textStream: textStream
            )
        )
    }
    
    
    convenience init(
          minimalSeverity: Severity = .debug
        , file: FileWithHandle
    )
        throws
    {
        try self.init(
              minimalSeverity: minimalSeverity
            , file: file
            , queue:
                DispatchQueue(
                    label: "com.urolog.async"
                    , qos: .utility
                )
        )
    }
    

    // MARK: Endpoint
    func acceptsSeverity(_ severity: Severity) -> Bool
    {
        origin.acceptsSeverity(severity)
    }
    
    
    func recieve(entry: String)
    {
        origin.recieve(entry: entry)
    }
    
    
    func mute()
    {
        origin.mute()
    }
    
    
    func unmute()
    {
        origin.unmute()
    }
    
    
    func with(format: Format<String>) -> Endpoint
    {
        let end = AsyncFileEndpoint(self.origin)
        end.preferredFormat = format
        
        return end
    }
       
    
    func with(identifier: String) -> Endpoint
    {
        let end = AsyncFileEndpoint(self.origin)
        end.identifier = identifier
        
        return end
    }
    
    
    func with(minimalSeverity: Severity) -> Endpoint
    {
        ConsoleEndpoint(minimalSeverity: minimalSeverity)
    }
}
