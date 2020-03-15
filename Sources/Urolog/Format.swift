//
//  Format.swift
//  Urolog
//
//  Created by Ivan on 8/29/19.
//  Copyright © 2019 ivadzy. All rights reserved.
//

import Foundation

/// Abstract format class
public class Format<T>
{
    open func format(severity: Severity, message: String, context: Context) -> T
    {
      fatalError("Not implemented")
    }
}







