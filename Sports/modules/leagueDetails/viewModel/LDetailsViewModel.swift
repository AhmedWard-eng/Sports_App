//
//  LDetailsViewModel.swift
//  Sports
//
//  Created by Ahmed Ward on 23/05/2023.
//

import Foundation

class LDetailsViewModel {
    
    
    var bindUpcomingToViewController : (()->()) = {}
    
    var bindLatestToViewController : (()->()) = {}
    
    var bindTeamsToViewController : (()->()) = {}
    
    var bindIsExistedInViewController : (() -> ()) = {}
    
    
    var cdManager : CDManager
    
    init(cdManager : CDManager){
        self.cdManager = cdManager
    }
    
    var isExisted : Bool?{
        didSet{
            bindIsExistedInViewController()
        }
    }
    
    var upcomingResult : UpComingResponse?{
        didSet{
            bindUpcomingToViewController()
        }
    }
    
    func addToFav(league: League){
        cdManager.insert(leagueItem: league)
    }
    
    func removeFromFav(league: League){
        cdManager.removeLeague(leagueData: league)
    }
    
    func isExistedInFav(league_key : Int) -> Bool{
        return   cdManager.isExistedInFav(league_key: league_key)
        
    }
    
    var latestResult : LatestEventResponse?{
        didSet{
            bindLatestToViewController()
        }
    }
    
    
    var teamsResult : TeamsResponse?{
        didSet{
            bindTeamsToViewController()
        }
    }
    
    
    
    func getLeagueData(sportName: String,leagueId: Int){
        NetworkService.getUpComingEvents(sportName : sportName, leagueId: leagueId){[weak self]  upcomingResponse in
            self?.upcomingResult = upcomingResponse
        }
        
        NetworkService.getTeams(sportName: sportName, leagueId: leagueId) {[weak self] teamsResponse in
            self?.teamsResult = teamsResponse
        }
        
        NetworkService.getLatestEvents(sportName: sportName, leagueId: leagueId) { [weak self] latest in
            self?.latestResult = latest
        }
        
    }
}
