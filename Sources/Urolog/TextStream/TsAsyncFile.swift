import Foundation


public final class TsAsyncFile: TextStream
{
    // MARK: - Initialisation
    private let queue: DispatchQueue
    
    init(origin: TextStream, queue: DispatchQueue)
    {
        self.origin = origin
        self.queue = queue
    }
    
    


    // MARK: - Private
    private let origin: TextStream
}




// MARK: - Public
public extension TsAsyncFile
{
    // MARK: Initilisation
    
    convenience init(handle: FileHandle, queue: DispatchQueue)
    {
        self.init(origin: TsFile(handle: handle), queue: queue)
    }
    
    
    // MARK: TextStream
    func write(_ entry: String)
    {
        queue.async { [origin] in
            origin.write(entry)
        }
    }
}
