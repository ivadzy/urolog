//
//  AsyncFileEndpoint.swift
//  Urolog
//
//  Created by Ivan on 8/31/19.
//  Copyright © 2019 ivadzy. All rights reserved.
//

import Foundation


public final class EndAsyncFile: Endpoint
{
    // MARK: - Initialization
    private let minimalSeverity: Severity
    private let textStream: TextStream
    private let queue: DispatchQueue
    
    public init(
        minimalSeverity: Severity = .debug
        , file: FileAtPath
        , queue: DispatchQueue = DispatchQueue(label: "com.urolog.async", qos: .background)
    ) throws
    {
        self.minimalSeverity = minimalSeverity
        self.queue = queue
        let fileHandle = try file.fileHandle()
        self.textStream = TsAsyncFile(handle: fileHandle, queue: queue)
        
        self.origin =
            try EndFile(
                minimalSeverity: minimalSeverity
                , writer: self.textStream
        )
    }
    
    
    
    // MARK: - Public
    public var preferredFormat:Format<String> = FrDefault()
    
    
    
    
    // MARK:  - Private
    private let origin: EndFile
}




// MARK: - Public
public extension EndAsyncFile
{
    // MARK:  Endpoint
    func acceptsSeverity(_ severity: Severity) -> Bool
    {
        minimalSeverity <= severity
    }
    
    
    func recieve(entry: String) {
        origin.recieve(entry: entry)
    }
}
