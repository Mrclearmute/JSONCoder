//
//  AIAlias.swift
//  JSONCoder
//
//  Created by Sinan Caliskan on 2023-03-16.
//

import Foundation
import NaturalLanguage
import CoreML

@available(macOS 13.0, iOS 16.0, tvOS 16.0, watchOS 8.0, *)
public typealias NoteTagger = NoteTagger_2
@available(macOS 13.0, iOS 16.0, tvOS 16.0, watchOS 8.0, *)
public func NoteTaggerPrediction(_ text: String) throws -> Array<String>{
    var result: [String] = []
    
    let config = MLModelConfiguration()
    let model = try! NoteTagger(configuration: config).model
    let customModel = try! NLModel(mlModel: model)
    
    let tagger = NLTagger(tagSchemes: [.nameType])
    tagger.string = text
    tagger.setModels([customModel], forTagScheme: .nameType)
    tagger.enumerateTags(in: text.startIndex..<text.endIndex, unit: .word,
                         scheme: .nameType, options: .omitWhitespace) { tag, tokenRange  in
        if let tag = tag {
            result.append(tag.rawValue)
        }
        return true
    }
    return result
}
