//
//  FileAtPath.swift
//  Urolog
//
//  Created by Ivan on 8/31/19.
//  Copyright © 2019 ivadzy. All rights reserved.
//

import Foundation


public protocol FileAtPath
{
    init(_ url: URL)
    init(_ path: String)
    
    func fileHandle() throws -> FileHandle
}
