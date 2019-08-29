//
//  DetailedFormat.swift
//  Urolog
//
//  Created by Ivan on 9/1/19.
//  Copyright © 2019 ivadzy. All rights reserved.
//

import Foundation

class DetailedFormat: FormatProtocol
{
    struct Constants
    {
        static let separator = " : "
    }
    
    func format(_ context: Context) -> String
    {
        return [
            "\(context.date)"
            , "[\(context.severity)]"
            , "[\(context.fileName)]"
            , "\(context.message)"
        ].joined(separator: Constants.separator) + "\n"
    }
}
