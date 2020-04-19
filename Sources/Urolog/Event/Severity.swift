import Foundation


public enum Severity: Int, Comparable, CustomStringConvertible
{
    case debug
    case info
    case warning
    case error
    
    
    public static func < (lhs: Severity, rhs: Severity) -> Bool
    {
        return lhs.rawValue < rhs.rawValue
    }
    
    public var description: String {
        switch self {
        case .debug:
            return "debug"
        case .info:
            return "info"
        case .warning:
            return "warning"
        case .error:
            return "error"
        }
    }
}
