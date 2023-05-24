//
//  LeagueViewModel.swift
//  Sports
//
//  Created by Ahmed Ward on 21/05/2023.
//

import Foundation

class LeagueViewModel{
    
    var bindResultToViewController : (()->()) = {}
    
    var result : LeagueResponse!{
        didSet{
            bindResultToViewController()
        }
    }
    
    
    
    func getLeagues(sportName: String){
        NetworkService.getLeague(sportName : sportName) {[weak self] (league) in
            self?.result = league
        }
    }
}
