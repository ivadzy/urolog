//
//  StandardOutputEndpoint.swift
//  Urolog
//
//  Created by Ivan on 9/1/19.
//  Copyright © 2019 ivadzy. All rights reserved.
//

import Foundation

public final class ConsoleEndpoint: Endpoint
{
    // MARK: - Initialization
    private(set) public var minimalSeverity: Severity
    private(set) public var format: FormatProtocol
    private(set) public var writer: Writer = ConsoleWriter()

    public required init(
        minimalSeverity: Severity = .debug
        , format: FormatProtocol = DefaultFormat()
        , writer: Writer = ConsoleWriter()
    )
    {
        self.format = format
        self.writer = writer
        self.minimalSeverity = minimalSeverity
    }
}

// MARK: - Public
// MARK: Endpoint
extension ConsoleEndpoint
{
    public func send(_ context: Context)
    {
        if
            minimalSeverity <= context.severity
        {
            let entry = format.format(context)
            writer.write(entry)
        }
    }
}



