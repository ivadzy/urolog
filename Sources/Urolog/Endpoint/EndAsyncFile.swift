import Foundation


public final class EndAsyncFile: Endpoint
{
    // MARK: - Initialisation
    init(origin: Endpoint) throws
    {
        self.origin = origin
    }
    
    
    
    
    // MARK: - Public
    public var preferredFormat: Format<String> = FmtDefault()
    
    
    
    
    // MARK: - Private
    private let origin: Endpoint
}




// MARK: - Public
public extension EndAsyncFile
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
        let textStream = TsAsyncFile(handle: handle, queue: queue)
        
        try self.init(origin:
            EndBasic(
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
}
