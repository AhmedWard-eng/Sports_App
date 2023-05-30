//
//  FakingNetwork.swift
//  SportsTests
//
//  Created by Ahmed Ward on 25/05/2023.
//

import Foundation
@testable import Sports

class FakingNetwork : NetworkServicesProtocol{
    
    static let upcomingAndLatestString = """
    {
      "success": 1,
      "result": [
        {
          "event_key": 1220753,
          "event_date": "2023-06-10",
          "event_time": "21:00",
          "event_home_team": "Manchester City",
          "home_team_key": 80,
          "event_away_team": "Inter Milan",
          "away_team_key": 79,
          "event_halftime_result": "",
          "event_final_result": "-",
          "event_ft_result": "",
          "event_penalty_result": "",
          "event_status": "",
          "country_name": "eurocups",
          "league_name": "UEFA Champions League - Final",
          "league_key": 3,
          "league_round": "Final",
          "league_season": "2022/2023",
          "event_live": "0",
          "event_stadium": "Atatürk Olimpiyat Stadı (İstanbul)",
          "event_referee": "S. Marciniak",
          "home_team_logo": "https://apiv2.allsportsapi.com/logo/80_manchester-city.jpg",
          "away_team_logo": "https://apiv2.allsportsapi.com/logo/79_inter-milan.jpg",
          "event_country_key": 1,
          "league_logo": "https://apiv2.allsportsapi.com/logo/logo_leagues/3_uefa_champions_league.png",
          "country_logo": null,
          "event_home_formation": "",
          "event_away_formation": "",
          "fk_stage_key": 7,
          "stage_name": "Final",
          "league_group": null,
          "goalscorers": [
            
          ],
          "substitutes": [
            
          ],
          "cards": [
            
          ],
          "lineups": {
            "home_team": {
              "starting_lineups": [
                
              ],
              "substitutes": [
                
              ],
              "coaches": [
                
              ],
              "missing_players": [
                
              ]
            },
            "away_team": {
              "starting_lineups": [
                
              ],
              "substitutes": [
                
              ],
              "coaches": [
                
              ],
              "missing_players": [
                
              ]
            }
          },
          "statistics": [
            
          ]
        }
      ]
    }
    """
    
    
    static let leaguesString =
    """
    success": 1,
      "result": [
        {
          "league_key": 4,
          "league_name": "UEFA Europa League",
          "country_key": 1,
          "country_name": "eurocups",
          "league_logo": "https://apiv2.allsportsapi.com/logo/logo_leagues/",
          "country_logo": null
        },
        {
          "league_key": 1,
          "league_name": "European Championship",
          "country_key": 1,
          "country_name": "eurocups",
          "league_logo": null,
          "country_logo": null
        }]
    """
    
    
    static let teamsString  = """
    {
      "success": 1,
      "result": [
        {
          "team_key": 252,
          "team_name": "Vaduz",
          "team_logo": "https://apiv2.allsportsapi.com/logo/252_vaduz.jpg",
          "players": [
            {
              "player_key": 1629638594,
              "player_name": "B. Büchel",
              "player_number": "1",
              "player_country": null,
              "player_type": "Goalkeepers",
              "player_age": "33",
              "player_match_played": "32",
              "player_goals": "0",
              "player_yellow_cards": "2",
              "player_red_cards": "0",
              "player_image": "https://apiv2.allsportsapi.com/logo/players/57359_b-buchel.jpg"
            },
            {
              "player_key": 3527883287,
              "player_name": "G. Foser",
              "player_number": "25",
              "player_country": null,
              "player_type": "Goalkeepers",
              "player_age": "20",
              "player_match_played": "0",
              "player_goals": "0",
              "player_yellow_cards": "0",
              "player_red_cards": "0",
              "player_image": "https://apiv2.allsportsapi.com/logo/players/185220_g-foser.jpg"
            },
            {
              "player_key": 3955729621,
              "player_name": "T. Öehri",
              "player_number": "30",
              "player_country": null,
              "player_type": "Goalkeepers",
              "player_age": "19",
              "player_match_played": "0",
              "player_goals": "0",
              "player_yellow_cards": "0",
              "player_red_cards": "0",
              "player_image": "https://apiv2.allsportsapi.com/logo/players/222768_t-oehri.jpg"
            },
            {
              "player_key": 2319172264,
              "player_name": "Gion Chande",
              "player_number": "42",
              "player_country": null,
              "player_type": "Goalkeepers",
              "player_age": "25",
              "player_match_played": "1",
              "player_goals": "0",
              "player_yellow_cards": "0",
              "player_red_cards": "0",
              "player_image": "https://apiv2.allsportsapi.com/logo/players/51198_gion-chande.jpg"
            },
            {
              "player_key": 1493798848,
              "player_name": "A. Goelzer",
              "player_number": "3",
              "player_country": null,
              "player_type": "Defenders",
              "player_age": "24",
              "player_match_played": "13",
              "player_goals": "1",
              "player_yellow_cards": "0",
              "player_red_cards": "0",
              "player_image": "https://apiv2.allsportsapi.com/logo/players/62602_a-goelzer.jpg"
            },
            {
              "player_key": 1841691210,
              "player_name": "A. Omerovic",
              "player_number": "5",
              "player_country": null,
              "player_type": "Defenders",
              "player_age": "24",
              "player_match_played": "9",
              "player_goals": "1",
              "player_yellow_cards": "2",
              "player_red_cards": "0",
              "player_image": "https://apiv2.allsportsapi.com/logo/players/52545_a-omerovic.jpg"
            },
            {
              "player_key": 3221956025,
              "player_name": "F. Rahimi",
              "player_number": "6",
              "player_country": null,
              "player_type": "Defenders",
              "player_age": "25",
              "player_match_played": "0",
              "player_goals": "0",
              "player_yellow_cards": "0",
              "player_red_cards": "0",
              "player_image": "https://apiv2.allsportsapi.com/logo/players/81011_f-rahimi.jpg"
            },
            {
              "player_key": 3756377344,
              "player_name": "K. Iodice",
              "player_number": "13",
              "player_country": null,
              "player_type": "Defenders",
              "player_age": "22",
              "player_match_played": "5",
              "player_goals": "0",
              "player_yellow_cards": "2",
              "player_red_cards": "0",
              "player_image": "https://apiv2.allsportsapi.com/logo/players/120869_k-iodice.jpg"
            },
            {
              "player_key": 723790901,
              "player_name": "A. Xhemajli",
              "player_number": "21",
              "player_country": null,
              "player_type": "Defenders",
              "player_age": "25",
              "player_match_played": "20",
              "player_goals": "2",
              "player_yellow_cards": "5",
              "player_red_cards": "0",
              "player_image": "https://apiv2.allsportsapi.com/logo/players/75508_a-xhemajli.jpg"
            },
            {
              "player_key": 389831331,
              "player_name": "D. Ulrich",
              "player_number": "23",
              "player_country": null,
              "player_type": "Defenders",
              "player_age": "25",
              "player_match_played": "26",
              "player_goals": "1",
              "player_yellow_cards": "5",
              "player_red_cards": "1",
              "player_image": "https://apiv2.allsportsapi.com/logo/players/53220_d-ulrich.jpg"
            },
            {
              "player_key": 4142691957,
              "player_name": "L. Traber",
              "player_number": "28",
              "player_country": null,
              "player_type": "Defenders",
              "player_age": "22",
              "player_match_played": "19",
              "player_goals": "0",
              "player_yellow_cards": "4",
              "player_red_cards": "0",
              "player_image": "https://apiv2.allsportsapi.com/logo/players/174047_l-traber.jpg"
            },
            {
              "player_key": 3070648167,
              "player_name": "G. Isik",
              "player_number": "29",
              "player_country": null,
              "player_type": "Defenders",
              "player_age": "23",
              "player_match_played": "25",
              "player_goals": "0",
              "player_yellow_cards": "10",
              "player_red_cards": "0",
              "player_image": "https://apiv2.allsportsapi.com/logo/players/89767_g-isik.jpg"
            },
            {
              "player_key": 730493666,
              "player_name": "F. Fehr",
              "player_number": "47",
              "player_country": null,
              "player_type": "Defenders",
              "player_age": "23",
              "player_match_played": "32",
              "player_goals": "2",
              "player_yellow_cards": "5",
              "player_red_cards": "0",
              "player_image": "https://apiv2.allsportsapi.com/logo/players/114806_f-fehr.jpg"
            },
            {
              "player_key": 2363087064,
              "player_name": "N. Hasler",
              "player_number": "4",
              "player_country": null,
              "player_type": "Midfielders",
              "player_age": "32",
              "player_match_played": "29",
              "player_goals": "3",
              "player_yellow_cards": "7",
              "player_red_cards": "0",
              "player_image": "https://apiv2.allsportsapi.com/logo/players/3892_n-hasler.jpg"
            },
            {
              "player_key": 903401056,
              "player_name": "M. Hadzi",
              "player_number": "7",
              "player_country": null,
              "player_type": "Midfielders",
              "player_age": "24",
              "player_match_played": "19",
              "player_goals": "4",
              "player_yellow_cards": "1",
              "player_red_cards": "0",
              "player_image": "https://apiv2.allsportsapi.com/logo/players/114812_m-hadzi.jpg"
            },
            {
              "player_key": 4225689678,
              "player_name": "S. Wieser",
              "player_number": "8",
              "player_country": null,
              "player_type": "Midfielders",
              "player_age": "30",
              "player_match_played": "6",
              "player_goals": "0",
              "player_yellow_cards": "1",
              "player_red_cards": "0",
              "player_image": "https://apiv2.allsportsapi.com/logo/players/3893_s-wieser.jpg"
            },
            {
              "player_key": 3773131549,
              "player_name": "T. Çiçek",
              "player_number": "10",
              "player_country": null,
              "player_type": "Midfielders",
              "player_age": "31",
              "player_match_played": "32",
              "player_goals": "12",
              "player_yellow_cards": "4",
              "player_red_cards": "0",
              "player_image": "https://apiv2.allsportsapi.com/logo/players/4945_t-cicek.jpg"
            },
            {
              "player_key": 2253643425,
              "player_name": "M. Gajić",
              "player_number": "14",
              "player_country": null,
              "player_type": "Midfielders",
              "player_age": "36",
              "player_match_played": "25",
              "player_goals": "0",
              "player_yellow_cards": "4",
              "player_red_cards": "0",
              "player_image": "https://apiv2.allsportsapi.com/logo/players/11973_m-gaji.jpg"
            },
            {
              "player_key": 2301807202,
              "player_name": "J. Ris",
              "player_number": "17",
              "player_country": null,
              "player_type": "Midfielders",
              "player_age": "22",
              "player_match_played": "8",
              "player_goals": "0",
              "player_yellow_cards": "1",
              "player_red_cards": "0",
              "player_image": "https://apiv2.allsportsapi.com/logo/players/131178_j-ris.jpg"
            },
            {
              "player_key": 2772437633,
              "player_name": "S. Lüchinger",
              "player_number": "20",
              "player_country": null,
              "player_type": "Midfielders",
              "player_age": "20",
              "player_match_played": "1",
              "player_goals": "0",
              "player_yellow_cards": "0",
              "player_red_cards": "0",
              "player_image": "https://apiv2.allsportsapi.com/logo/players/152567_s-luchinger.jpg"
            },
            {
              "player_key": 2426587247,
              "player_name": "C. Gasser",
              "player_number": "24",
              "player_country": null,
              "player_type": "Midfielders",
              "player_age": "25",
              "player_match_played": "21",
              "player_goals": "1",
              "player_yellow_cards": "4",
              "player_red_cards": "0",
              "player_image": "https://apiv2.allsportsapi.com/logo/players/93374_c-gasser.jpg"
            },
            {
              "player_key": 1287544073,
              "player_name": "G. Pepsi",
              "player_number": "53",
              "player_country": null,
              "player_type": "Midfielders",
              "player_age": "24",
              "player_match_played": "15",
              "player_goals": "0",
              "player_yellow_cards": "1",
              "player_red_cards": "0",
              "player_image": "https://apiv2.allsportsapi.com/logo/players/52588_g-pepsi.jpg"
            },
            {
              "player_key": 491434070,
              "player_name": "K. Dobras",
              "player_number": "77",
              "player_country": null,
              "player_type": "Midfielders",
              "player_age": "30",
              "player_match_played": "24",
              "player_goals": "2",
              "player_yellow_cards": "5",
              "player_red_cards": "0",
              "player_image": "https://apiv2.allsportsapi.com/logo/players/6818_k-dobras.jpg"
            },
            {
              "player_key": 1732029262,
              "player_name": "R. Fosso",
              "player_number": "80",
              "player_country": null,
              "player_type": "Midfielders",
              "player_age": "20",
              "player_match_played": "27",
              "player_goals": "0",
              "player_yellow_cards": "6",
              "player_red_cards": "0",
              "player_image": "https://apiv2.allsportsapi.com/logo/players/189260_r-fosso.jpg"
            },
            {
              "player_key": 1710700697,
              "player_name": "M. Sutter",
              "player_number": "9",
              "player_country": null,
              "player_type": "Forwards",
              "player_age": "32",
              "player_match_played": "27",
              "player_goals": "1",
              "player_yellow_cards": "3",
              "player_red_cards": "0",
              "player_image": "https://apiv2.allsportsapi.com/logo/players/4186_m-sutter.jpg"
            },
            {
              "player_key": 2051222331,
              "player_name": "T. Väyrynen",
              "player_number": "11",
              "player_country": null,
              "player_type": "Forwards",
              "player_age": "30",
              "player_match_played": "9",
              "player_goals": "0",
              "player_yellow_cards": "0",
              "player_red_cards": "0",
              "player_image": "https://apiv2.allsportsapi.com/logo/players/3222_t-vayrynen.jpg"
            },
            {
              "player_key": 1623770082,
              "player_name": "D. Đokić",
              "player_number": "19",
              "player_country": null,
              "player_type": "Forwards",
              "player_age": "22",
              "player_match_played": "29",
              "player_goals": "6",
              "player_yellow_cards": "1",
              "player_red_cards": "0",
              "player_image": "https://apiv2.allsportsapi.com/logo/players/120866_d-oki.jpg"
            },
            {
              "player_key": 3383441118,
              "player_name": "F. Sasere",
              "player_number": "27",
              "player_country": null,
              "player_type": "Forwards",
              "player_age": "24",
              "player_match_played": "32",
              "player_goals": "2",
              "player_yellow_cards": "2",
              "player_red_cards": "0",
              "player_image": "https://apiv2.allsportsapi.com/logo/players/115827_f-sasere.jpg"
            },
            {
              "player_key": 1450532733,
              "player_name": "E. Rastoder",
              "player_number": "74",
              "player_country": null,
              "player_type": "Forwards",
              "player_age": "21",
              "player_match_played": "29",
              "player_goals": "6",
              "player_yellow_cards": "1",
              "player_red_cards": "0",
              "player_image": "https://apiv2.allsportsapi.com/logo/players/174045_e-rastoder.jpg"
            }
          ],
          "coaches": [
            {
              "coach_name": "M. Stocklasa",
              "coach_country": null,
              "coach_age": null
            }
          ]
        }
      ]
    }
    """
    
    static var data : Data = Data()
    
    static var shouldReturnError : Bool!
    
    
    
      
    
    static func setShouldReturnError(_ isError : Bool){
        shouldReturnError = isError
    }
    
    
//    func getEmployees(completionHandler: @escaping (TestingNetwork.MyResult?, Error?) -> Void) {
//        if shouldReturnError {
//            completionHandler(nil,ResponseWithError.responseError)
//
//        }else{
//            do{
//                let result = try JSONDecoder().decode(MyResult.self, from: data)
//                completionHandler(result,nil)
//            }catch let error {
//                print(error.localizedDescription)
//                completionHandler(nil,error)
//            }
//        }
//    }
    
    
    static func getLeague(sportName: String, completionHandler: @escaping (LeagueResponse?) -> Void) {
        if shouldReturnError {
            
            data = Data(leaguesString.utf8)
            completionHandler(nil)

        }else{
            do{
                let result = try JSONDecoder().decode(LeagueResponse.self, from: data)
                completionHandler(result)
            }catch let error {
                print(error.localizedDescription)
                completionHandler(nil)
            }
        }
    }
    
    static func getUpComingEvents(sportName: String, leagueId: Int, completionHandler: @escaping (UpComingResponse?) -> Void) {
        
        data = Data(upcomingAndLatestString.utf8)
        if shouldReturnError {
            completionHandler(nil)

        }else{
            do{
                let result = try JSONDecoder().decode(UpComingResponse.self, from: data)
                completionHandler(result)
            }catch let error {
                print(error.localizedDescription)
                completionHandler(nil)
            }
        }
    }
    
    static func getLatestEvents(sportName: String, leagueId: Int, completionHandler: @escaping (LatestEventResponse?) -> Void) {
        
        data = Data(upcomingAndLatestString.utf8)
        if shouldReturnError {
            completionHandler(nil)

        }else{
            do{
                let result = try JSONDecoder().decode(LatestEventResponse.self, from: data)
                completionHandler(result)
            }catch let error {
                print(error.localizedDescription)
                completionHandler(nil)
            }
        }
    }
    
    static func getTeams(sportName: String, leagueId: Int, completionHandler: @escaping (TeamsResponse?) -> Void) {
        
        data = Data(teamsString.utf8)
        if shouldReturnError {
            completionHandler(nil)

        }else{
            do{
                let result = try JSONDecoder().decode(TeamsResponse.self, from: data)
                completionHandler(result)
            }catch let error {
                print(error.localizedDescription)
                completionHandler(nil)
            }
        }
    }
}


enum ResponseWithError : Error{
    case responseError
}
