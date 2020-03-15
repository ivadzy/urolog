//
//  Event.swift
//  Urolog
//
//  Created by Ivan on 8/30/19.
//  Copyright © 2019 ivadzy. All rights reserved.
//

import Foundation




public struct Event
{
    public let severity: Severity
    public let message: String
    public let context: Context
    
    
    func send(to endpoint: Endpoint, with format: Format<String>)
    {
        if endpoint.acceptsSeverity(severity) {
            let entry = printed(format)
            
            endpoint.recieve(entry: entry)
        }
    }
    
    
    func printed<T>(_ format: Format<T>) -> T
    {
        format.format(
            severity: severity
            , message: message
            , context: context
        )
    }
}
