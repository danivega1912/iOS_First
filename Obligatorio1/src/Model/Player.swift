//
//  Player.swift
//  Obligatorio1
//
//  Created by Daniel Vega on 5/3/18.
//  Copyright © 2018 Daniel Vega. All rights reserved.
//

import Foundation

class Player {
    private var name:String = ""
    private var number:String = ""
    private var team:String = ""
    
    init() {
    }
    
    init(name:String, number:String, team:String) {
        self.name = name
        self.number = number
        self.team = team
    }
    
    func getTeam() -> String {
        return team
    }
    
    func getName() -> String {
        return name
    }
    
    func getNumber() -> String {
        return number
    }
    
}
