//
//  FakeDataBase.swift
//  SportsTests
//
//  Created by Ahmed Ward on 30/05/2023.
//

import Foundation

@testable import Sports


class FakeCoreData : DataBaseProtocol{
    
    var leagues : [LeagueDTO]?
    
    func setLeagues(leagues : [LeagueDTO]){
        self.leagues = leagues
    }
    func insert(leagueItem: LeagueDTO) {
        leagues?.append(leagueItem)
    }
    
    func fetchLeague() -> [LeagueDTO] {
        return leagues ?? []
    }
    
    func removeLeague(leagueData: LeagueDTO) {
        
        for (index, league) in leagues!.enumerated(){
            if(league.league_key == leagueData.league_key){
                leagues!.remove(at: index)
            }
        }
    }
    
    func removeAll() {
        leagues?.removeAll()
    }
    
    func isExistedInFav(league_key: Int) -> Bool {
        return true
    }
    
    
    
    
    
}
