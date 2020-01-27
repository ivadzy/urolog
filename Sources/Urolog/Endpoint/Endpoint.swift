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
    var minimalSeverity: Severity { get }
    var format: Format { get }
    var writer: Writer { get }
    
    func send(_ context: Context)
}
