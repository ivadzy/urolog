//
//  AsyncFileEndpoint.swift
//  Urolog
//
//  Created by Ivan on 8/31/19.
//  Copyright © 2019 ivadzy. All rights reserved.
//

import Foundation


public final class AsyncFileEndpoint: Endpoint
{
    // MARK: - Initialization
    public let minimalSeverity: Severity
    public let format: Format
    public let writer: Writer
    
    private let queue: DispatchQueue
    
    
    public required init(
        minimalSeverity: Severity = .debug
        , format: Format = DefaultFormat()
        , writer: Writer
        , queue: DispatchQueue
    ) throws
    {
        self.format = format
        self.minimalSeverity = minimalSeverity
        self.queue = queue
        self.writer = writer
        
        self.fileEndpoint =
            try FileEndpoint(
                minimalSeverity: minimalSeverity
                , format: format
                , writer: self.writer
        )
    }
    
    
    public convenience init(
        minimalSeverity: Severity = .debug
        , format: Format = DefaultFormat()
        , file: FileAtPath
    ) throws
    {
        let queue = AsyncFileEndpoint.defaultQueue
        let handle = try file.fileHandle()
        let writer = AsyncFileWriter(handle: handle, queue: queue)
        
        try self.init(
            minimalSeverity: minimalSeverity
            , format: format
            , writer: writer
            , queue: queue
        )
    }
    
    
    
    
    // MARK:  - Private
    private let fileEndpoint: FileEndpoint
    
    
    private static let defaultQueue: DispatchQueue =
        DispatchQueue(
            label: "com.urolog.async"
            , qos: .background
    )
}




// MARK: - Public
extension AsyncFileEndpoint
{
    // MARK:  Endpoint
    public func send(_ context: Context)
    {
        fileEndpoint.send(context)
    }
}
