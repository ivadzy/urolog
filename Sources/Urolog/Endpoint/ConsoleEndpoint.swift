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
    
    
    func with(format: Format<String>) -> Endpoint
    {
        let end = ConsoleEndpoint(origin)
        end.preferredFormat = format
        
        return end
    }
    
    
    func with(minimalSeverity: Severity) -> Endpoint
    {
        ConsoleEndpoint(minimalSeverity: minimalSeverity)
    }
}



