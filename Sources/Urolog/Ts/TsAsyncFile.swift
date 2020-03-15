//
//  TsAsyncFile.swift
//  Urolog
//
//  Created by Ivan on 8/31/19.
//  Copyright © 2019 ivadzy. All rights reserved.
//

import Foundation


public final class TsAsyncFile: TextStream
{
    // MARK: - Initialisation
    private let queue: DispatchQueue
    
    init(handle: FileHandle, queue: DispatchQueue)
    {
        self.origin = TsFile(handle: handle)
        self.queue = queue
    }
    
    
    
    
    // MARK: - Private
    private let origin: TsFile
}




// MARK: - Public
extension TsAsyncFile
{
    public func write(_ entry: String)
    {
        queue.async { [origin] in
            origin.write(entry)
        }
    }
}
