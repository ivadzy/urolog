//
//  LogFileAtPath.swift
//  Urolog
//
//  Created by Ivan on 9/1/19.
//  Copyright © 2019 ivadzy. All rights reserved.
//

import Foundation


public final class LogFileAtPath: FileAtPath
{
    // MARK: - Initialization
    private let url: URL
    public init(_ url: URL)
    {
        self.url = url
    }
    
    
    public convenience init(_ path: String)
    {
        self.init(
            URL(fileURLWithPath: path)
        )
    }
}




// MARK: - Public
public extension LogFileAtPath
{
    func fileHandle() throws -> FileHandle
    {
        try prepareFile(at: url)
        return try FileHandle(forUpdating: url)
    }
}




// MARK: - Private
private extension LogFileAtPath
{
    func prepareFile(at url: URL) throws
    {
        let path =
            url.path
        
        if !fileExists(at: path)
        {
            createFile(path)
        }
        else if !fileIsWritable(at: path)
        {
            throw IOError.pathIsNotWritable
        }
    }
    
    
    func createFile(_ path: String)
    {
        FileManager.default.createFile(
            atPath: url.path
            , contents: nil
            , attributes: nil
        )
    }
    
    
    func fileExists(at path: String) -> Bool
    {
        FileManager.default.fileExists(atPath: path)
    }
    
    
    func fileIsWritable(at path: String) -> Bool
    {
        FileManager.default.isWritableFile(atPath: path)
    }
}




// MARK: -
extension LogFileAtPath
{
    public enum IOError: Error
    {
        case pathIsNotWritable
    }
}
