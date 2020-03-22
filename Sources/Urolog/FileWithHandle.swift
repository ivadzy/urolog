import Foundation


public protocol FileWithHandle
{
    func fileHandle() throws -> FileHandle
}
