//
//  NetworkServices.swift
//  SportsApp
//
//  Created by Rafeef Esam on 06/05/2023.
//

import Foundation
import Alamofire


class NetworkService : NetworkServicesProtocol {
    
    static func getLeague(sportName: String, completionHandler: @escaping (LeagueResponse?) -> Void ) {
        
        AF.request("https://apiv2.allsportsapi.com/\(sportName)/?met=Leagues&APIkey=597609427d3b9bfeacc757ea0f97f7f34a1484b8846cdf935644c1630b8cb775", method: .get).responseDecodable(of: LeagueResponse.self) { response in
            
            switch response.result {
            case .success(let data):
                print("done")
                completionHandler(data )
            case .failure(let error):
                print("Error: \(error)")
            }
            
            
        }
    }
    
    static func getUpComingEvents(sportName: String, leagueId: Int, completionHandler: @escaping (UpComingResponse?) -> Void) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let currentDate = dateFormatter.string(from: Date())
        print("currentDate: \(currentDate)") // Output: "2023-05-09"
        
        
        let nextYearDate = Calendar.current.date(byAdding: .year, value: 1, to: Date())!
        let nextYearDateString = dateFormatter.string(from: nextYearDate)
        
        print("nextYearDate: \(nextYearDateString)")
        
        AF.request("https://apiv2.allsportsapi.com/\(sportName)/?met=Fixtures&leagueId=\(leagueId)&from=\(currentDate)&to=\(nextYearDateString)&APIkey=597609427d3b9bfeacc757ea0f97f7f34a1484b8846cdf935644c1630b8cb775", method: .get).responseDecodable(of: UpComingResponse.self) { response in
            
            switch response.result {
            case .success(let data):
                print("done")
                completionHandler(data )
            case .failure(let error):
                print("Error: \(error)")
            }
            
            
        }
    }
//
    static func getLatestEvents(sportName: String, leagueId: Int, completionHandler: @escaping (LatestEventResponse?) -> Void) {
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let currentDate = dateFormatter.string(from: Date())
        print("currentDate: \(currentDate)") // Output: "2023-05-09"
        
        
        let lastYearDate = Calendar.current.date(byAdding: .year, value: -1, to: Date())!
        let lastYearDateString = dateFormatter.string(from: lastYearDate)
        print("lastYear \(lastYearDateString)")
        AF.request("https://apiv2.allsportsapi.com/\(sportName)/?met=Fixtures&leagueId=\(leagueId)&from=\(lastYearDateString)&to=\(currentDate)&APIkey=597609427d3b9bfeacc757ea0f97f7f34a1484b8846cdf935644c1630b8cb775", method: .get).responseDecodable(of: LatestEventResponse.self) { response in
            
            switch response.result {
            case .success(let data):
                print("done")
                completionHandler(data )
            case .failure(let error):
                print("Error: \(error)")
            }
            
            
        }
    }
//
    static func getTeams(sportName: String, leagueId: Int, completionHandler: @escaping (TeamsResponse?) -> Void) {

        AF.request("https://apiv2.allsportsapi.com/\(sportName)/?met=Teams&?met=Leagues&leagueId=\(leagueId)&APIkey=597609427d3b9bfeacc757ea0f97f7f34a1484b8846cdf935644c1630b8cb775", method: .get).responseDecodable(of: TeamsResponse.self) { response in
            
            switch response.result {
            case .success(let data):
                print("done")
                completionHandler(data )
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
//
}
