//
//  TsConsole.swift
//  Urolog
//
//  Created by Ivan on 8/31/19.
//  Copyright © 2019 ivadzy. All rights reserved.
//

import Foundation


public final class TsConsole: TextStream
{
    // MARK: - Private
    private let origin = TsFile(handle: .standardError)
}




// MARK: - Public
public extension TsConsole
{
    func write(_ entry: String)
    {
        origin.write(entry)
    }
}
