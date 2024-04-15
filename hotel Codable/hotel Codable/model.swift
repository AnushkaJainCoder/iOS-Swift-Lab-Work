//
//  model.swift
//  hotel Codable
//
//  Created by student on 11/04/24.
//

import UIKit

struct RoomType: Equatable {
    var id: Int
    var name: String
    var shortName: String
    var price: Int
    
    
    static func ==(lhs: RoomType , rhs: RoomType) -> Bool {
        
        return lhs.id == rhs.id
        
        var allTypes: [RoomType]{
            return (
                [
                    RoomType(id: 1 , name: "Two Queens" , shortName:"2Qs" , price:160),
                    RoomType(id: 2 , name: "TOne King" , shortName:"k" , price:260),
                    RoomType(id: 3 , name: "Penthouse Suite" , shortName:"PHS" , price:130),
                    
                ]
            )
        }
    }
}
