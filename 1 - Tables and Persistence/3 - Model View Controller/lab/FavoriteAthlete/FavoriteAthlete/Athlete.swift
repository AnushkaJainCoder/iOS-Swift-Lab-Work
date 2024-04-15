//
//  Athlete.swift
//  FavoriteAthlete
//
//  Created by student on 05/04/24.
//

import Foundation
struct Athlete{
    var name: String
    var age: String
    var league: String
    var team: String
    var desc: String{
        return "\(name) is \(age)yrs old and plays for the \(team) n the \(league) "
    }
}
