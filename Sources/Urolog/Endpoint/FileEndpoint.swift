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
    public let minimalSeverity: Severity
    public let format: Format
    public let writer: Writer
    public required init(
          minimalSeverity: Severity = .debug
        , format: Format = DefaultFormat()
        , writer: Writer
    ) throws
    {
        self.format = format
        self.minimalSeverity = minimalSeverity
        self.writer = writer
    }
    
    
    convenience init(
          minimalSeverity: Severity = .debug
        , format: Format = DefaultFormat()
        , fileAtPath: FileAtPath
    ) throws
    {
        try self.init(minimalSeverity: minimalSeverity
            , format: format
            , writer: FileWriter(handle: fileAtPath.fileHandle())
        )
    }
}




// MARK: - Public
extension FileEndpoint
{
    // MARK: Endpoint
    func send(_ context: Context)
    {
        if minimalSeverity <= context.severity
        {
            let entry = format.format(context)
            
            writer.write(entry)
        }
    }
}
