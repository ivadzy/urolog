//
//  File.swift
//  
//
//  Created by Ivan on 3/15/20.
//

import Foundation

public final class FrJSON: Format<String>
{
    // MARK: Format
    override public func format(
        severity: Severity
        , message: String
        , context: Context
    )
        -> String
    {
        return """
        {
            "severity": \(severity),
            "message": \(message),
            "context": ""
        }
        """
    }
}
