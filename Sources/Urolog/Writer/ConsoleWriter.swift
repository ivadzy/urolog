//
//  ConsoleWriter.swift
//  Urolog
//
//  Created by Ivan on 8/31/19.
//  Copyright © 2019 ivadzy. All rights reserved.
//

import Foundation


public final class TsConsole: TextStream
{
    // MARK: - Initialization
    public init() {}
    
    
    
    
    // MARK: - Private
    private let standardOutput =
        FileHandle.standardOutput
}




// MARK: - Public
public extension TsConsole
{
    // MARK: Writer
    func write(_ entry: String)
    {
        if
            let data = entry.data(using: .utf8)
        {
            standardOutput.write(data)
        }
    }
}
