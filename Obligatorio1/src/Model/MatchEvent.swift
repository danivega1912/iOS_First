//
//  MatchDetail.swift
//  Obligatorio1
//
//  Created by Daniel Vega on 5/1/18.
//  Copyright © 2018 Daniel Vega. All rights reserved.
//

import Foundation

struct MatchEvent {
    private var eventTeam:String
    private var eventImage:String
    private var eventPlayer:String
    private var eventTime:Int
    
    init(team:String, image:String, player:String, time:Int) {
        eventTeam = team
        eventImage = image
        eventPlayer = player
        eventTime = time
    }
    
    func getTeam() -> String {
        return eventTeam
    }
    
    func getImage() -> String {
        return eventImage
    }
    
    func getPlayer() -> String {
        return eventPlayer
    }
    
    func getTime() -> String {
        return String(eventTime)
    }
}
