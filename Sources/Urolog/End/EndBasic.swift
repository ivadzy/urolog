//
//  EndBasic.swift
//  Urolog
//
//  Created by Ivan on 8/31/19.
//  Copyright © 2019 ivadzy. All rights reserved.
//

import Foundation


public final class EndBasic: Endpoint
{
    // MARK: - Initialisation
    private let minimalSeverity: Severity
    private let textStream: TextStream
    
    public required init(
          minimalSeverity: Severity = .debug
        , textStream: TextStream
    )
    {
        self.minimalSeverity = minimalSeverity
        self.textStream = textStream
    }
    



    // MARK: - Public
    public var preferredFormat: Format<String> = FrDefault()
    



    // MARK: - Private
    var muted: Bool = false
}




// MARK: - Public
public extension EndBasic
{
    // MARK: Endpoint
    func acceptsSeverity(_ severity: Severity) -> Bool
    {
        minimalSeverity <= severity
    }
    
    
    func recieve(entry: String)
    {
        if !muted {
            textStream.write(entry)
        }
    }
    
    
    func mute()
    {
        muted = true
    }
    
    
    func unmute()
    {
        muted = false
    }
}
