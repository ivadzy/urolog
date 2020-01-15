//
//  Context.swift
//  Urolog
//
//  Created by Ivan on 8/30/19.
//  Copyright © 2019 ivadzy. All rights reserved.
//

import Foundation

public struct Context
{
    public let severity: Severity
    public let message: String
    public let date: Date
    
    public let functionName: String
    public let filePath: String
    public var fileName: String { return (self.filePath as NSString).lastPathComponent }
    public let lineNumber: Int
    
    public let threadName: String
    public let isMainThread: Bool
}
