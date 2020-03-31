import Foundation


public final class AsyncFileTextStream: TextStream
{
    // MARK: - Initialisation
    private let origin: TextStream
    
    private let queue: DispatchQueue
    
    init(origin: TextStream, queue: DispatchQueue)
    {
        self.origin = origin
        self.queue = queue
    }
}




// MARK: - Public
public extension AsyncFileTextStream
{
    // MARK: Initilisation
    convenience init(handle: FileHandle, queue: DispatchQueue)
    {
        self.init(
              origin: FileTextStream(handle: handle)
            , queue: queue
        )
    }
    
    
    // MARK: TextStream
    func write(_ entry: String)
    {
        queue.async { [origin] in
            origin.write(entry)
        }
    }
}
