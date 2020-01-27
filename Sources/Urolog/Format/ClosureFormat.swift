//
//  File.swift
//  
//
//  Created by Ivan on 1/27/20.
//

import Foundation


public final class ClosureFormat: Format
{
    // MARK: - Initialisation
    private let handler: (Context) -> String
    public init(_ handler: @escaping (Context) -> String)
    {
        self.handler = handler
    }
}




// MARK: - Public
public extension ClosureFormat
{
    func format(_ context: Context) -> String
    {
        handler(context)
    }
}
