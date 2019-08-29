//
//  Format.swift
//  Urolog
//
//  Created by Ivan on 8/29/19.
//  Copyright © 2019 ivadzy. All rights reserved.
//

import Foundation
import os

public protocol FormatProtocol
{
    func format(_ context: Context) -> String
}

// MARK: - Concrete Format

public final class Format: FormatProtocol
{
    private let handler: (Context) -> String
    public init(_ handler: @escaping (Context) -> String)
    {
        self.handler = handler
    }
}

extension Format
{
    public func format(_ context: Context)
        -> String
    {
        return handler(context)
    }
}





