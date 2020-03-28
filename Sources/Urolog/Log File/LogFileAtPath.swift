import Foundation


extension LogFileAtPath
{
    public enum IOError: Error
    {
        case unableToCreateFile
        case pathIsNotWritable
    }
}


public final class LogFileAtPath: FileWithHandle
{
    // MARK: - Initialisation
    private let url: URL
    
    public init(_ url: URL)
    {
        self.url = url
    }
    
    
    public convenience init(_ path: String)
    {
        self.init(URL(fileURLWithPath: path))
    }
}




// MARK: - Public
public extension LogFileAtPath
{
    // MARK: FileWithHandle
    func fileHandle() throws -> FileHandle {
        try createFileHandle(with: url)

        return try FileHandle(forUpdating: url)
    }
}




// MARK: - Private
private extension LogFileAtPath
{
    func createFileHandle(with url: URL) throws
    {
        let path = url.path
        
        if !fileExists(at: path), !createFile(path) {
            throw IOError.unableToCreateFile
        }
        
        if !fileIsWritable(at: path) {
            throw IOError.pathIsNotWritable
        }
    }
    
    
    func createFile(_ path: String) -> Bool
    {
        FileManager.default.createFile(
            atPath: path
            , contents: nil
            , attributes: nil
        )
    }
    
    
    func fileExists(at path: String) -> Bool
    {
        FileManager.default.fileExists(atPath: path)
    }
    
    
    func fileIsWritable(at path: String) -> Bool
    {
        FileManager.default.isWritableFile(atPath: path)
    }
}
