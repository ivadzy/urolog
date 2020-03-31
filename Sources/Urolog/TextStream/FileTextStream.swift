import Foundation


public final class FileTextStream: TextStream
{
    // MARK: - Initialisation
    private let fileHandle: FileHandle
    
    init(handle: FileHandle)
    {
        self.fileHandle = handle
    }
}




// MARK: - Public
extension FileTextStream
{
    // MARK: TextStream
    public func write(_ entry: String)
    {
        if let data = data(from: entry) {
            fileHandle.seekToEndOfFile()
            fileHandle.write(data)
        }
    }
}




// MARK: - Private
private extension FileTextStream
{
    func data(from entry: String) -> Data?
    {
        entry.data(using: .utf8)
    }
}
