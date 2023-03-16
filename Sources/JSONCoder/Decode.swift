//
//  File 2.swift
//  
//
//  Created by Sinan Caliskan on 2023-03-15.
//

import Foundation

extension Bundle{
    func decode<T: Decodable>(Decode file: T.Type, from: String) throws -> T{
        let url = URL(string: from)!
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let decodedData = try decoder.decode(file, from: data)
        return decodedData
    }
}
