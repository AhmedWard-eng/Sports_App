//
//  FavViewModelTest.swift
//  SportsTests
//
//  Created by Ahmed Ward on 30/05/2023.
//

import XCTest
@testable import Sports

final class FavViewModelTest: XCTestCase {
    let fakeCoreData = FakeCoreData()
    var favViewModel  : FavViewModel{
            FavViewModel(cd: fakeCoreData)
    }
    
    var leagues : [LeagueDTO] = [LeagueDTO(league_key: 0, league_name: "ch", league_logo: "", country_key: 2, country_name: "", sportType: .football),
                                 LeagueDTO(league_key: 1, league_name: "ch2", league_logo: "", country_key: 0, country_name: "", sportType: .football),
                                 LeagueDTO(league_key: 2, league_name: "ch3", league_logo: "", country_key: 0, country_name: "", sportType: .football)]
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTheReturnOfDataSizeEquality(){
        fakeCoreData.setLeagues(leagues: leagues)
        XCTAssertEqual(favViewModel.getLeagues().count, leagues.count)
        
    }

    
    func testTheReturnOfDataHasTheSameValues(){
        fakeCoreData.setLeagues(leagues: leagues)
        XCTAssertEqual(favViewModel.getLeagues()[0].league_name, leagues[0].league_name)
        
    }
    
    func testIfTheDataSizeIncreasedByOneAfterAdding(){
        fakeCoreData.setLeagues(leagues: leagues)
        fakeCoreData.insert(leagueItem: LeagueDTO(league_key: 3, league_name: "ch3", league_logo: "", country_key: 0, country_name: "", sportType: .football))
        XCTAssertEqual(favViewModel.getLeagues().count, leagues.count + 1)
    }
    
    func testIfTheDataSizeDecreasedByOneAfterAdding(){
        fakeCoreData.setLeagues(leagues: leagues)
        fakeCoreData.removeLeague(leagueData: LeagueDTO(league_key: 2, league_name: "ch3", league_logo: "", country_key: 0, country_name: "", sportType: .football))
        XCTAssertEqual(favViewModel.getLeagues().count, leagues.count - 1)
    }
    
    func testafterRemovingAll(){
        fakeCoreData.setLeagues(leagues: leagues)
        fakeCoreData.removeAll()
        XCTAssertEqual(favViewModel.getLeagues().count, 0)
    }
}
