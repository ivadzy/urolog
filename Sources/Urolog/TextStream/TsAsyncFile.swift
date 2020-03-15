//
//  AsyncWriter.swift
//  Urolog
//
//  Created by Ivan on 8/31/19.
//  Copyright © 2019 ivadzy. All rights reserved.
//

import Foundation


public final class TsAsyncFile: TextStream
{
    // MARK: - Initialization
    private let queue: DispatchQueue
    init(
        handle: FileHandle
        , queue: DispatchQueue
    )
    {
        self.fileWriter = TsFile(handle: handle)
        self.queue = queue
    }
    
    
    
    
    // MARK: - Private
    private let fileWriter: TsFile
}




// MARK: - Public
extension TsAsyncFile
{
    // MARK: Writer
    public func write(_ entry: String)
    {
        queue.async { [fileWriter] in
            fileWriter.write(entry)
        }
    }
}
