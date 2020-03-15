//
//  StandardOutputEndpoint.swift
//  Urolog
//
//  Created by Ivan on 9/1/19.
//  Copyright © 2019 ivadzy. All rights reserved.
//

import Foundation


public final class EndConsole: Endpoint
{
    // MARK: - Initialization
    private let minimalSeverity: Severity
    private let textStream: TextStream = TsConsole()
    
    public required init(minimalSeverity: Severity = .debug)
    {
        self.minimalSeverity = minimalSeverity
    }
    
    
    
    
    // MARK: - Public
    public var preferredFormat:Format<String> = FrDefault()
}




// MARK: - Public
public extension EndConsole
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



