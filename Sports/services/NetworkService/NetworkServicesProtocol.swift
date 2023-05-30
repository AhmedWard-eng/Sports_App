//
//  NetworkServicesProtocol.swift
//  SportsApp
//
//  Created by Rafeef Esam on 06/05/2023.
//

import Foundation
protocol NetworkServicesProtocol : FetchLeaguesProtocol, FetchUpComingEventsProtocol, FetchLatestEventsProtocol,
                                   FetchTeamsProtocol {
    static func getLeague(sportName: String , completionHandler: @escaping (LeagueResponse?) -> Void )
    
    static func getUpComingEvents(sportName: String ,leagueId: Int , completionHandler: @escaping (UpComingResponse?) -> Void )
    
    static func getLatestEvents(sportName: String ,leagueId: Int , completionHandler: @escaping (LatestEventResponse?) -> Void )
    
    static func getTeams(sportName: String ,leagueId: Int , completionHandler: @escaping (TeamsResponse?) -> Void )
}
