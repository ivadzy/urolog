//
//  DefaultFormat.swift
//  Urolog
//
//  Created by Ivan on 9/1/19.
//  Copyright © 2019 ivadzy. All rights reserved.
//

import Foundation


public final class FrDefault: Format<String>
{
    // MARK: Format
    override public func format(
        severity: Severity
        , message: String
        , context: Context
    )
        -> String
    {
        return [
            "\(context.date)"
            , "[\(severity)]"
            , "\(message)"
            ].joined(separator: " - ") + "\n"
    }
}
