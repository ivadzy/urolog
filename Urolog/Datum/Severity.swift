//
//  Severity.swift
//  Urolog
//
//  Created by Ivan on 8/30/19.
//  Copyright © 2019 ivadzy. All rights reserved.
//

import Foundation

public enum Severity: Int, Comparable
{
    case debug
    case info
    case warning
    case error
    
    public static func < (lhs: Severity, rhs: Severity) -> Bool
    {
        return lhs.rawValue < rhs.rawValue
    }
}
