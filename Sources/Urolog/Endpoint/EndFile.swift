//
//  FileEndpoint.swift
//  Urolog
//
//  Created by Ivan on 8/31/19.
//  Copyright © 2019 ivadzy. All rights reserved.
//

import Foundation


public final class EndFile: Endpoint
{
    // MARK: - Initialization
    private let minimalSeverity: Severity
    private let textStream: TextStream
    
    public required init(
          minimalSeverity: Severity = .debug
        , writer: TextStream
    ) throws
    {
        self.minimalSeverity = minimalSeverity
        self.textStream = writer
    }
    
    
    
    // MARK: - Public
    public var preferredFormat:Format<String> = FrDefault()
}




// MARK: - Public
public extension EndFile
{
    // MARK: Endpoint
    func acceptsSeverity(_ severity: Severity) -> Bool
    {
        minimalSeverity <= severity
    }
    
    
    func recieve(entry: String)
    {
        textStream.write(entry)
    }
}
