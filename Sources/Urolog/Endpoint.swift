import Foundation


public protocol Endpoint
{
    var identifier: String { get set }
    
    var preferredFormat: Format<String> { get set }
 
 
 
 
 
    func acceptsSeverity(_ severity: Severity) -> Bool
    
    func recieve(entry: String)
    
    func mute()
    
    func unmute()
    
    
    func with(format: Format<String>) -> Endpoint
    
    func with(identifier: String) -> Endpoint
    
    func with(minimalSeverity: Severity) -> Endpoint
}
