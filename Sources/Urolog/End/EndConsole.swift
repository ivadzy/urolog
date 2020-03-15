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
    // MARK: - Initialisation
    public required init(minimalSeverity: Severity = .debug)
    {
        self.origin =
            EndBasic(
                minimalSeverity: minimalSeverity
                , textStream: TsConsole()
            )
    }
    
    
    
    
    // MARK: - Public
    public var preferredFormat: Format<String> = FrDefault()
    
    
    
    // MARK: - Private
    private let origin: EndBasic
}




// MARK: - Public
public extension EndConsole
{
    // MARK: Endpoint
    func acceptsSeverity(_ severity: Severity) -> Bool
    {
        origin.acceptsSeverity(severity)
    }
    
    
    func recieve(entry: String)
    {
        origin.recieve(entry: entry)
    }
    
    
    func mute()
    {
        origin.mute()
    }
    
    
    func unmute()
    {
        origin.unmute()
    }
}



