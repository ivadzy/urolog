//
//  FileEndpoint.swift
//  Urolog
//
//  Created by Ivan on 8/31/19.
//  Copyright © 2019 ivadzy. All rights reserved.
//

import Foundation

final class FileEndpoint: Endpoint
{
    // MARK: - Initialization
    private(set) var minimalSeverity: Severity
    private(set) var format: FormatProtocol
    private(set) var writer: Writer
    private let file: FileAtPath
    public required init(
        minimalSeverity: Severity = .debug
        , format: FormatProtocol = DefaultFormat()
        , fileAtPath: FileAtPath
        , writer: Writer
    ) throws
    {
        self.format = format
        self.minimalSeverity = minimalSeverity
        self.file = fileAtPath
        self.writer = writer
    }
}

// MARK: - Public
// MARK: Endpoint
extension FileEndpoint
{
    func send(_ context: Context)
    {
        if
            minimalSeverity <= context.severity
        {
            let entry = format.format(context)
            writer.write(entry)
        }
    }
}

extension FileEndpoint
{
    convenience init(
        minimalSeverity: Severity = .debug
        , format: FormatProtocol = DefaultFormat()
        , fileAtPath: FileAtPath
    
    ) throws
    {
        try self.init(minimalSeverity: minimalSeverity
            , format: format
            , fileAtPath: fileAtPath
            , writer: FileWriter(handle: fileAtPath.fileHandle())
        )
    }
}
