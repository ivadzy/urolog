//
//  EndFile.swift
//  Urolog
//
//  Created by Ivan on 8/31/19.
//  Copyright © 2019 ivadzy. All rights reserved.
//

import Foundation


public final class EndFile: Endpoint
{
    public convenience init(file: FileWithHandle) throws
    {
        try self.init(minimalSeverity: .debug, file: file)
    }
    
    
    public init(minimalSeverity: Severity, file: FileWithHandle) throws
    {
        try file.createFileHandle()
        let handle = try file.fileHandle()
        let textStream = TsFile(handle: handle)
        
        self.origin =
            EndBasic(
                minimalSeverity: minimalSeverity
                , textStream: textStream
            )
    }
    
    
    
    // MARK: - Public
    public var preferredFormat: Format<String> = FrDefault()
    
    
    
    
    // MARK: - Private
    private let origin: EndBasic
}




// MARK: - Public
public extension EndFile
{
    // MARK:  Endpoint
    func acceptsSeverity(_ severity: Severity) -> Bool
    {
        origin.acceptsSeverity(severity)
    }
    
    
    func recieve(entry: String) {
        origin.recieve(entry: entry)
    }
    
    
    func mute() {
        origin.mute()
    }
    
    
    func unmute() {
        origin.unmute()
    }
}
