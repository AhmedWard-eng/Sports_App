//
//  LeagueRoot.swift
//  Sports
//
//  Created by Ahmed Ward on 20/05/2023.
//

import Foundation
class LeagueResponse : Decodable {
    var result : [League]
    var success : Int?
}
