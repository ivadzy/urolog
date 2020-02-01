//
//  Context.swift
//  Urolog
//
//  Created by Ivan on 8/30/19.
//  Copyright © 2019 ivadzy. All rights reserved.
//

import Foundation


// TODO: https://blog.g4s8.wtf/fully-encapsulated/
public struct Context
{
    public let severity: Severity
    public let message: String
    public let date: Date
    
    public let lineNumber: Int
    public let functionName: String
    
    public let filePath: String
    public var fileName: String {
        self.filePath.lastPathComponent
    }
    
    public let threadName: String
    public let isMainThread: Bool
}
