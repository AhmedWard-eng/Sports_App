//
//  LatestEventResponse.swift
//  Sports
//
//  Created by Ahmed Ward on 20/05/2023.
//

import Foundation
class LatestEventResponse : Decodable {
    var success : Int?
    var result : [LatestEvents]
}
