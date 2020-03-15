//
//  File.swift
//  
//
//  Created by Ivan on 3/15/20.
//

import Foundation

public struct Context
{
    public let date: Date
    
    public let lineNumber: Int
    public let functionName: String
    
    public let filePath: String
    
    public let threadName: String
    public let isMainThread: Bool
}
