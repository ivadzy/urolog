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
    public let format: FormatProtocol
    public let writer: Writer
    private let queue: DispatchQueue
    public required init(
        minimalSeverity: Severity = .debug
        , format: FormatProtocol = DefaultFormat()
        , fileAtPath: FileAtPath
        , queue: DispatchQueue
    ) throws
    {
        self.format = format
        self.minimalSeverity = minimalSeverity
        self.queue = queue
        
        let handle = try fileAtPath.fileHandle()
        self.writer = AsyncFileWriter(handle: handle, queue: queue)
        
        self.fileEndpoint =
            try FileEndpoint(
                minimalSeverity: minimalSeverity
                , format: format
                , fileAtPath: fileAtPath
                , writer: self.writer
            )
    }
    
    // MARK:  - Private
    private let fileEndpoint: FileEndpoint
    
    // MARK: Asynchronous I/O
    private static let dispatchQueueLabel = "com.urolog.async"
    private static let defaultQueue: DispatchQueue = {
        let q =
            DispatchQueue(
                label: AsyncFileEndpoint.dispatchQueueLabel,
                qos: .background
            )
        return q
    }()
}

// MARK: - Public
// MARK:  Endpoint
extension AsyncFileEndpoint
{
    public func send(_ context: Context)
    {
        fileEndpoint.send(context)
    }
}

extension AsyncFileEndpoint
{
    public convenience init(
        minimalSeverity: Severity = .debug
        , format: FormatProtocol = DefaultFormat()
        , fileAtPath: FileAtPath
    
    ) throws
    {
        try self.init(
                minimalSeverity: minimalSeverity
                , format: format
                , fileAtPath: fileAtPath
                , queue: AsyncFileEndpoint.defaultQueue
            )
    }
}
