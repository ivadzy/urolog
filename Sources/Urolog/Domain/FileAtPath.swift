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
    func fileHandle() throws -> FileHandle
}
