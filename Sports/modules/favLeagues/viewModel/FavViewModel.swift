//
//  FavViewModel.swift
//  Sports
//
//  Created by Ahmed Ward on 25/05/2023.
//

import Foundation

class FavViewModel{
    
    var cd : DataBaseProtocol
    
    init(cd: DataBaseProtocol) {
        self.cd = cd
    }
    
    func getLeagues() -> [LeagueDTO]{
        return cd.fetchLeague()
    }
}
