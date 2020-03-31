import Foundation


public final class ConsoleTextStream: TextStream
{
    // MARK: - Initialisation
    private let origin: TextStream
    
    init(_ origin: TextStream)
    {
        self.origin = origin
    }
}




// MARK: - Public
public extension ConsoleTextStream
{
    // MARK: Initilisation
    convenience init()
    {
        self.init(
            FileTextStream(handle: .standardError)
        )
    }
    
    
    // MARK: TextStream
    func write(_ entry: String)
    {
        origin.write(entry)
    }
}
