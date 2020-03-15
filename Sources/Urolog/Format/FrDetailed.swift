//
//  DetailedFormat.swift
//  Urolog
//
//  Created by Ivan on 9/1/19.
//  Copyright © 2019 ivadzy. All rights reserved.
//

import Foundation


public final class FrDetailed: Format<String>
{
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
            , "[\(context.filePath)]"
            , "[\(context.functionName)]"
            , "\(message)"
            ].joined(separator: " - ") + "\n"
    }
}
