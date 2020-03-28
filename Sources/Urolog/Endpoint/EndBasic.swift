import Foundation


public final class EndBasic: Endpoint
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
    public var preferredFormat: Format<String> = FmtDefault()
    
    public var identifier: String = "com.urolog.endpoint.basic"



    // MARK: - Private
    var muted: Bool = false
}




// MARK: - Public
public extension EndBasic
{
    // MARK: Intialisation
    convenience init(
        minimalSeverity: Severity = .debug
        , file: FileWithHandle
    ) throws
    {
        let handle = try file.fileHandle()
        let textStream = TsFile(handle: handle)
        
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
}
