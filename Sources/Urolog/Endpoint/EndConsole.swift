import Foundation


public final class EndConsole: Endpoint
{
    
    // MARK: - Initialisation
    public required init(origin: Endpoint)
    {
        self.origin = origin
    }
    
    
    
    
    // MARK: - Public
    public var preferredFormat: Format<String> = FmtDefault()
    
    public var identifier: String = "com.urolog.endpoint.console"
    


    
    // MARK: - Private
    private let origin: Endpoint
}




// MARK: - Public
public extension EndConsole
{
    // MARK: - Initialisation
    convenience init(minimalSeverity: Severity = .debug)
    {
        self.init(origin:
            EndBasic(
                minimalSeverity: minimalSeverity
                , textStream: TsConsole()
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



