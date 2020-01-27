//
//  DefaultFormat.swift
//  Urolog
//
//  Created by Ivan on 9/1/19.
//  Copyright © 2019 ivadzy. All rights reserved.
//

import Foundation


public final class DefaultFormat: Format
{
    // MARK: - Initialisation
    public init() {}
}




// MARK: - Public
extension DefaultFormat
{
    // MARK: Format
    public func format(_ context: Context) -> String
    {
        return [
            "\(context.date)"
            , "[\(context.severity)]"
            , "\(context.message)"
        ].joined(separator: .formatSeparator) + "\n"
    }
}
