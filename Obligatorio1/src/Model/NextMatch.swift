//
//  NextMatch.swift
//  Obligatorio1
//
//  Created by Daniel Vega on 5/3/18.
//  Copyright © 2018 Daniel Vega. All rights reserved.
//

import Foundation

class NextMatch {
    private var matchId:Int
    private var versusTeam:String
    private var versusTeamLogo:String
    private var stadiumName:String
    private var matchDate:String
    
    init(matchId:Int, versusTeam:String, versusTeamLogo:String, stadiumName:String, matchDate:String) {
        self.matchId = matchId
        self.versusTeam = versusTeam
        self.versusTeamLogo = versusTeamLogo
        self.stadiumName = stadiumName
        self.matchDate = matchDate
    }
    
    func getMatchId() -> Int {
        return matchId
    }
    
    func getVersusTeam() -> String {
        return versusTeam
    }
    
    func getVersusTeamLogo() -> String {
        return versusTeamLogo
    }
    
    func getStadiumName() -> String {
        return stadiumName
    }
    
    func getMatchDate() -> String {
        return matchDate
    }
    
}
