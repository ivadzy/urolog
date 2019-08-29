//
//  LogFileAtPath.swift
//  Urolog
//
//  Created by Ivan on 9/1/19.
//  Copyright © 2019 ivadzy. All rights reserved.
//

import Foundation

// MARK: - Constants, Errors
extension LogFileAtPath
{
    enum IOError: Error
    {
        case pathIsNotWritable
    }
}

public final class LogFileAtPath: FileAtPath
{
    // MARK: Initialization
    private let url: URL
    public init(_ url: URL)
    {
        self.url = url
    }
    
    public convenience init(_ path: String)
    {
        self.init(URL(fileURLWithPath: path))
    }
}

// MARK: - Public
extension LogFileAtPath
{
    public func fileHandle() throws -> FileHandle
    {
        try prepareFile(at: url)
        return try FileHandle(forUpdating: url)
    }
}

extension LogFileAtPath
{
    private func prepareFile(at url: URL) throws
    {
        let path = url.path
        if
            !fileExists(at: path)
        {
            createFile(path)
        }
        else if !fileIsWritable(at: path)
        {
            throw IOError.pathIsNotWritable
        }
    }
    
    private func createFile(_ path: String)
    {
        FileManager.default.createFile(
            atPath: url.path
            , contents: nil
            , attributes: nil
        )
    }
    
    private func fileExists(
        at path: String
        )
        -> Bool
    {
        return FileManager.default.fileExists(atPath: path)
    }
    
    private func fileIsWritable(
        at path: String
        )
        -> Bool
    {
        return FileManager.default.isWritableFile(atPath: path)
    }
}
