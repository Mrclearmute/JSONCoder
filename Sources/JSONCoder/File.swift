//
//  File.swift
//  
//
//  Created by Sinan Caliskan on 2023-03-15.
//

import Foundation

@available(macOS 13.0, iOS 16.0, tvOS 16.0, watchOS 8.0, *)
public extension FileManager{
    func encode<T: Encodable>(save file: T, to url: String, options: Data.WritingOptions) throws {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileurl = paths[0].appending(path: url)
        let encoder = JSONEncoder()
        let data = try encoder.encode(file)
        try data.write(to: fileurl, options: options)
    }
}
