//
//  Content.swift
//  MnB
//
//  Created by Morris Murega on 2/21/23.
//

import Foundation

class Content : NSObject, Codable{
    var title : String
    var desc: String
    
    private enum CodingKeys : String, CodingKey{
        case title
        case desc
    }

    
    init(title : String, desc: String){
        self.title = title
        self.desc = desc
    }
    
    required init(from decoder: Decoder) throws {
        let container = try  decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        desc = try container.decode(String.self, forKey: .desc)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(desc, forKey: .desc)
    }
    
}
