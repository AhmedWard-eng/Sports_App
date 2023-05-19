//
//  TeamsResponse.swift
//  Sports
//
//  Created by Ahmed Ward on 20/05/2023.
//

import Foundation
class TeamsResponse :Decodable{
    var success : Int?
    var result : [Teams]
}
