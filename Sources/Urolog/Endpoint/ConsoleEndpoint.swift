import Foundation


public final class ConsoleEndpoint: Endpoint
{
    // MARK: - Initialisation
    private let origin: Endpoint
    
    public required init(_ origin: Endpoint)
    {
        self.origin = origin
    }
    
    
    
    
    // MARK: - Public
    public var preferredFormat: Format<String> = DefaultFormat()
    
    public var identifier: String = "com.urolog.endpoint.console"
}




// MARK: - Public
public extension ConsoleEndpoint
{
    // MARK: - Initialisation
    convenience init(minimalSeverity: Severity = .debug)
    {
        self.init(
            BasicEndpoint(
                  minimalSeverity: minimalSeverity
                , textStream: ConsoleTextStream()
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
}



