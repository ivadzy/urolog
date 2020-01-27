//
//  FileWriter.swift
//  Urolog
//
//  Created by Ivan on 8/31/19.
//  Copyright © 2019 ivadzy. All rights reserved.
//

import Foundation


public final class FileWriter: Writer
{
    // MARK: - Initialization
    private let fileHandle: FileHandle
    init(handle: FileHandle)
    {
        self.fileHandle = handle
    }
}




// MARK: - Public
extension FileWriter
{
    // MARK: Writer
    public func write(_ entry: String)
    {
        if let data = data(from: entry)
        {
            fileHandle.seekToEndOfFile()
            fileHandle.write(data)
        }
    }
}




// MARK: - Private
private extension FileWriter
{
    func data(from entry: String) -> Data?
    {
        entry.data(using: .utf8)
    }
}
