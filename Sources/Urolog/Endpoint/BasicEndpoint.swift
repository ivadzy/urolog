import Foundation


public final class BasicEndpoint: Endpoint
{
    // MARK: - Initialisation
    private let minimalSeverity: Severity
    
    private let textStream: TextStream
    
    public init(
          minimalSeverity: Severity = .debug
        , textStream: TextStream
    )
    {
        self.minimalSeverity = minimalSeverity
        self.textStream = textStream
    }
    



    // MARK: - Public
    public var preferredFormat: Format<String> = DefaultFormat()
    
    public var identifier: String = "com.urolog.endpoint.basic"




    // MARK: - Private
    var muted: Bool = false
}




// MARK: - Public
public extension BasicEndpoint
{
    // MARK: Intialisation
    convenience init(
          minimalSeverity: Severity = .debug
        , file: FileWithHandle
    )
        throws
    {
        let handle = try file.fileHandle()
        let textStream = FileTextStream(handle: handle)
        
        self.init(
              minimalSeverity: minimalSeverity
            , textStream: textStream
        )
    }
    
        
    // MARK: Endpoint
    func acceptsSeverity(_ severity: Severity) -> Bool
    {
        minimalSeverity <= severity
    }
    
    
    func recieve(entry: String)
    {
        if !muted {
            textStream.write(entry)
        }
    }
    
    
    func mute()
    {
        muted = true
    }
    
    
    func unmute()
    {
        muted = false
    }
    
    
    func with(format: Format<String>) -> Endpoint
    {
        let end = BasicEndpoint(minimalSeverity: minimalSeverity, textStream: textStream)
        end.preferredFormat = format
        
        return end
    }
    
    
    func with(minimalSeverity: Severity) -> Endpoint
    {
        BasicEndpoint(minimalSeverity: minimalSeverity, textStream: textStream)
    }
}
