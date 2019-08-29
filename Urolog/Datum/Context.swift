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
    let severity: Severity
    let message: String
    let date: Date
    
    let functionName: String
    let filePath: String
    var fileName: String { return (self.filePath as NSString).lastPathComponent }
    let lineNumber: Int
    
    let threadName: String
    let isMainThread: Bool
}
