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
    public let minimalSeverity: Severity
    public let format: Format
    public let writer: Writer = ConsoleWriter()
    
    
    public required init(
        minimalSeverity: Severity = .debug
        , format: Format = DefaultFormat()
    )
    {
        self.format = format
        self.minimalSeverity = minimalSeverity
    }
}




// MARK: - Public
extension ConsoleEndpoint
{
    // MARK: Endpoint
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



