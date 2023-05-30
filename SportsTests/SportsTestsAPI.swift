//
//  SportsTests.swift
//  SportsTests
//
//  Created by Ahmed Ward on 20/05/2023.
//

import XCTest
@testable import Sports

final class SportsTestsAPI: XCTestCase {


    func testGetLeagues(){
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        let exp = expectation(description: "Network")
        
        NetworkService.getLeague(sportName: Sports.football.rawValue, completionHandler: { r in
            XCTAssertNotNil(r)
            exp.fulfill()
        })
        
        waitForExpectations(timeout: 5)
    }
    
    func testGetTeams(){
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        let exp = expectation(description: "Network")
        
        NetworkService.getTeams(sportName: Sports.football.rawValue, leagueId: 3, completionHandler: { r in
            XCTAssertNotNil(r)
            exp.fulfill()
        })
        
        waitForExpectations(timeout: 5)
    }
    
    func testGetUpComingEvents(){
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        let exp = expectation(description: "Network")
        
        NetworkService.getUpComingEvents(sportName: Sports.football.rawValue, leagueId: 3, completionHandler: { r in
            XCTAssertNotNil(r)
            exp.fulfill()
        })
        
        waitForExpectations(timeout: 5)
    }
    
    func testGetLatestEvents(){
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        let exp = expectation(description: "Network")
        
        NetworkService.getLatestEvents(sportName: Sports.football.rawValue, leagueId: 3, completionHandler: { r in
            XCTAssertNotNil(r)
            exp.fulfill()
        })
        
        waitForExpectations(timeout: 5)
    }
    


}
