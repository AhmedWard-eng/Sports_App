//
//  LeagueModel.swift
//  Sports
//
//  Created by Ahmed Ward on 25/05/2023.
//

import Foundation
import Foundation


class LeagueDTO {
    var league_key:Int?
    var league_name:String?
    var league_logo:String?
    var country_key:Int?
    var country_name:String?
    var sportType : Sports?
    
    init(league_key: Int?, league_name: String?, league_logo: String?, country_key: Int?, country_name: String?, sportType: Sports) {
        self.league_key = league_key
        self.league_name = league_name
        self.league_logo = league_logo
        self.country_key = country_key
        self.country_name = country_name
        self.sportType = sportType
    }
}

func convertLeagueDTO_TO_League(leagueDTO : LeagueDTO) -> League{
    let league = League()
    
    league.league_key = leagueDTO.league_key
    league.league_logo = leagueDTO.league_logo
    league.country_key = leagueDTO.country_key
    league.league_name = leagueDTO.league_name
    league.country_name = leagueDTO.country_name
    
    return league
    
}

func convertLeague_TO_LeagueDTO(league : League,sportType : Sports) -> LeagueDTO{
    
    return LeagueDTO(
        league_key: league.league_key,
        league_name: league.league_name,
        league_logo: league.league_logo,
        country_key: league.country_key,
        country_name: league.country_name,
        sportType: sportType)
    
}
