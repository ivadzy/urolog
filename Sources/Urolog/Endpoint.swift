import Foundation


public protocol Endpoint
{
    var preferredFormat: Format<String> { get set }
 
 
 
 
    func acceptsSeverity(_ severity: Severity) -> Bool
    
    
    func recieve(entry: String)
    
    
    func mute()
    
    
    func unmute()
}
