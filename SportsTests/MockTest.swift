//
//  MockTest.swift
//  SportsTests
//
//  Created by Ahmed Ward on 25/05/2023.
//

import XCTest
@testable import Sports
final class MockTest: XCTestCase {

//    let fake = FakingNetwork()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetLeagues(){
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        FakingNetwork.shouldReturnError = false
        let exp = expectation(description: "Network")
        
        FakingNetwork.getLeague(sportName: Sports.football.rawValue, completionHandler: { r in
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
        
        FakingNetwork.shouldReturnError = false
        let exp = expectation(description: "Network")
        
        FakingNetwork.getTeams(sportName: Sports.football.rawValue, leagueId: 3, completionHandler: { r in
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
        
        FakingNetwork.shouldReturnError = false
        let exp = expectation(description: "Network")
        
        FakingNetwork.getUpComingEvents(sportName: Sports.football.rawValue, leagueId: 3, completionHandler: { r in
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
        FakingNetwork.shouldReturnError = false
        let exp = expectation(description: "Network")
        
        
        FakingNetwork.getLatestEvents(sportName: Sports.football.rawValue, leagueId: 3, completionHandler: { r in
            XCTAssertNotNil(r)
            exp.fulfill()
        })
        
        waitForExpectations(timeout: 5)
    }

}
