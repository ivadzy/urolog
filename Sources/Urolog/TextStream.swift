import Foundation


public protocol TextStream: TextOutputStream
{
    func write(_ text: String)
}
