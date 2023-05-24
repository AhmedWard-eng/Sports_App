//
//  FavViewModel.swift
//  Sports
//
//  Created by Ahmed Ward on 25/05/2023.
//

import Foundation

class FavViewModel{
    
    var cd : CDManager
    
    init(cd: CDManager) {
        self.cd = cd
    }
    
    func getLeagues() -> [League]{
        return cd.fetchLeague()
    }
}
