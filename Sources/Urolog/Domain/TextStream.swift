//
//  Target.swift
//  Urolog
//
//  Created by Ivan on 8/30/19.
//  Copyright © 2019 ivadzy. All rights reserved.
//

import Foundation


public protocol TextStream: TextOutputStream
{
    func write(_ text: String)
}
