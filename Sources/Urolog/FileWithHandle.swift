import Foundation


public protocol FileWithHandle
{
    func createFileHandle() throws
    func fileHandle() throws -> FileHandle
}
