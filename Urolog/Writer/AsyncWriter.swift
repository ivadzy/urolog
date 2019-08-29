//
//  AsyncWriter.swift
//  Urolog
//
//  Created by Ivan on 8/31/19.
//  Copyright © 2019 ivadzy. All rights reserved.
//

import Foundation

public final class AsyncFileWriter: Writer
{
    // MARK: - Initialization
    private let queue: DispatchQueue
    init(
        handle: FileHandle
        , queue: DispatchQueue
    )
    {
        self.fileWriter = FileWriter(handle: handle)
        self.queue = queue
    }
    
    // MARK: - Private
    private let fileWriter: FileWriter
}


// MARK: - Public
// MARK: Writer
extension AsyncFileWriter
{
    public func write(_ entry: String)
    {
        queue.async { [fileWriter] in
            fileWriter.write(entry)
        }
    }
}
