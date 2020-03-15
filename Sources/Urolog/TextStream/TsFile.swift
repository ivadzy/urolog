//
//  FileWriter.swift
//  Urolog
//
//  Created by Ivan on 8/31/19.
//  Copyright © 2019 ivadzy. All rights reserved.
//

import Foundation


public final class TsFile: TextStream
{
    // MARK: - Initialization
    private let fileHandle: FileHandle
    init(handle: FileHandle)
    {
        self.fileHandle = handle
    }
}




// MARK: - Public
extension TsFile
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
private extension TsFile
{
    func data(from entry: String) -> Data?
    {
        entry.data(using: .utf8)
    }
}
