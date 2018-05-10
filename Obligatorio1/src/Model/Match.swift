//
//  Match.swift
//  Obligatorio1
//
//  Created by Daniel Vega on 5/1/18.
//  Copyright © 2018 Daniel Vega. All rights reserved.
//

import Foundation

class Match {
    private var matchId:Int
    private var stadium:Stadium
    private var teamA:Team
    private var teamB:Team
    private var matchDateTime:String
    private var played:Bool
    private var teamAScore:Int = 0
    private var teamBScore:Int = 0
    private var group:String
    
    // details about match is pending.
    
    init(id:Int, stadium:Stadium, teamA:Team, teamB:Team, dateTime:String, played:Bool, teamAScore:Int, teamBScore:Int, group:String) {
        self.matchId = id
        self.stadium = stadium
        self.teamA = teamA
        self.teamB = teamB
        self.matchDateTime = dateTime
        self.played = played
        self.teamAScore = teamAScore
        self.teamBScore = teamBScore
        self.group = group
    }
    
    func getMatchId() -> Int {
        return matchId
    }
    func getStadium() -> Stadium {
        return stadium
    }
    
    func getTeamA() -> Team {
        return teamA
    }
    
    func getTeamB() -> Team {
        return teamB
    }
    
    func getMatchDateTime() -> String {
        return matchDateTime
    }
    
    func getPlayed() -> Bool {
        return played
    }
    
    func getTeamAScore() -> Int {
        return teamAScore
    }
    
    func getTeamBScore() -> Int {
        return teamBScore
    }
    
    func getGroup() -> String {
        return group
    }
    
}
