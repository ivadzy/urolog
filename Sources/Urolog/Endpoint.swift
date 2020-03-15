//
//  Endpoint.swift
//  Urolog
//
//  Created by Ivan on 8/29/19.
//  Copyright © 2019 ivadzy. All rights reserved.
//

import Foundation


public protocol Endpoint
{
    var preferredFormat: Format<String> { get set }
 
 
 
 
    func acceptsSeverity(_ severity: Severity) -> Bool
    
    
    func recieve(entry: String)
    
    
    func mute()
    
    
    func unmute()
}
