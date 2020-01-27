//
//  File.swift
//  
//
//  Created by Ivan on 1/27/20.
//

import Foundation

extension String
{
    static let formatSeparator = " : "
    
    var lastPathComponent: String {
        (self as NSString).lastPathComponent
    }
}
