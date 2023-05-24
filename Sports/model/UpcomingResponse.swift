//
//  UpcomingResponse.swift
//  Sports
//
//  Created by Ahmed Ward on 20/05/2023.
//

import Foundation

class UpComingResponse : Decodable {
    var result : [UpCommingEvent]
    var success : Int?
}
