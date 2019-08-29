//
//  DefaultFormat.swift
//  Urolog
//
//  Created by Ivan on 9/1/19.
//  Copyright © 2019 ivadzy. All rights reserved.
//

import Foundation

extension DefaultFormat
{
    private struct Constants
    {
        static let separator = " : "
    }
}

public final class DefaultFormat: FormatProtocol
{
    // MARK: Initialization
    public init() {}
}

// MARK: - Public
// MARK: FormalProtocol
extension DefaultFormat
{
    public func format(_ context: Context) -> String
    {
        return [
            "\(context.date)"
            , "[\(context.severity)]"
            , "\(context.message)"
        ].joined(separator: Constants.separator) + "\n"
    }
}
