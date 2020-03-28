import Foundation


public final class TsConsole: TextStream
{
    // MARK: - Initialisation
    init(origin: TextStream)
    {
        self.origin = origin
    }
    
    
    
    
    // MARK: - Private
    private let origin: TextStream
}




// MARK: - Public
public extension TsConsole
{
    // MARK: Initilisation
    convenience init()
    {
        self.init(origin: TsFile(handle: .standardError))
    }
    
    
    // MARK: TextStream
    func write(_ entry: String)
    {
        origin.write(entry)
    }
}
