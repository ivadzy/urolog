//
//  DetailedFormat.swift
//  Urolog
//
//  Created by Ivan on 9/1/19.
//  Copyright © 2019 ivadzy. All rights reserved.
//

import Foundation


public final class DetailedFormat: Format
{
    // MARK: - Initialisation
    public init() {}
}




// MARK: - Public
public extension DetailedFormat
{
    func format(_ context: Context) -> String
    {
        return [
            "\(context.date)"
            , "[\(context.severity)]"
            , "[\(context.fileName)]"
            , "[\(context.functionName)]"
            , "\(context.message)"
            ].joined(separator: .formatSeparator) + "\n"
    }
}
