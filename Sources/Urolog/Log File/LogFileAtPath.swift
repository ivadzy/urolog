//
//  ╔══════════╗
//  ║  Urolog    True OOP logging framework
//  ╚══════════╝
//
import Foundation


extension LogFile
{
    public enum IOError: Error
    {
        case pathIsNotWritable
    }
}




public final class LogFile: FileWithHandle
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
public extension LogFile
{
    func fileHandle() throws -> FileHandle {
        try createFile(url.path)
        
        return try FileHandle(forUpdating: url)
    }
}




// MARK: - Private
private extension LogFile
{
    func createFileHandle() throws
    {
        let path = url.path
        
        if !fileExists(at: path) {
            createFile(path)
        }
        
        if !fileIsWritable(at: path) {
            throw IOError.pathIsNotWritable
        }
    }
    
    
    func createFile(_ path: String)
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
