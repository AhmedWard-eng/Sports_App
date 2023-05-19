//
//  ViewController.swift
//  Sports
//
//  Created by Ahmed Ward on 20/05/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkService.getLeague(sportName: "football") { l in
            print(l?.result[3].league_name)
        }
        
        NetworkService.getTeamDetails(sportName: "football", teamId: 252){ l in
            print(l?.result[0].players?[0].player_name)
        }
        
        NetworkService.getTeams(sportName: "football", leagueId: 302) { l in
            
            print(l!.result.count)
        }
        
        NetworkService.getLatestEvents(sportName: "football", leagueId: 3) { l in
            print(l?.result[0].event_date)
        }
        
        NetworkService.getUpComingEvents(sportName: "football", leagueId: 3) { l in
            print(l?.result[0].event_away_team)
        }
        // Do any additional setup after loading the view.
    }


}

