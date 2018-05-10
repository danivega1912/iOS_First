//
//  TeamClass.swift
//  Obligatorio1
//
//  Created by Daniel Vega on 4/30/18.
//  Copyright © 2018 Daniel Vega. All rights reserved.
//

import Foundation

class Team {
    
    private var id:Int = 0
    private var name:String = ""
    private var logo:String = ""
    private var players:[Player] = []
    private var substitutePlayers:[Player] = []
    private var manager:Player = Player()
    private var nextMatches:[NextMatch] = []
    
    init() {
        
    }
    
    init(id:Int, name:String, logo:String, players:[Player], substitutePlayers:[Player], manager:Player, nextMatches:[NextMatch]) {
        self.id = id
        self.name = name
        self.logo = logo
        self.players = players
        self.substitutePlayers = substitutePlayers
        self.manager = manager
        self.nextMatches = nextMatches
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getLogo() -> String {
        return self.logo
    }
    
    func getPlayers() -> [Player] {
        return players
    }
    
    func getNextMatches() -> [NextMatch] {
        return nextMatches
    }
    
    func getSubstitutePlayers() -> [Player] {
        return substitutePlayers
    }
    
    func getManager() -> Player {
        return manager
    }
    
    func getPlayersSections() -> [[Player]] {
        //return structure for tableView
        var fullTeam:[[Player]] = []
        (players.count > 0 ? fullTeam.append(players): nil)
        (substitutePlayers.count > 0 ? fullTeam.append(substitutePlayers): nil)
        (manager.getName() != "" ? fullTeam.append([manager]): nil)
        return fullTeam
    }
    
}
