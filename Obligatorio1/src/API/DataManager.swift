//
//  DataManager.swift
//  Obligatorio1
//
//  Created by Daniel Vega on 5/1/18.
//  Copyright © 2018 Daniel Vega. All rights reserved.
//

import Foundation

class DataManager {
    
    private let uruguayPlayers:[Player] = [
        Player(name: "Fernando Muslera", number: "1", team: "Galatasaray"),
        Player(name: "José María Gimenez", number: "2", team: "Atlético de Madrid"),
        Player(name: "Diego Godín", number: "3", team: "Atlético de Madrid"),
        Player(name: "Luís Suarez", number: "9", team: "Barcelona FC")
    ]
    
    private let uruguaySubstitutePlayers:[Player] = [
        Player(name: "Palito Pereyra", number: "7", team: "no idea"),
        Player(name: "Pelado Caceres", number: "14", team: "no idea")
    ]
    
    private let uruguayManager:Player = Player(name: "Oscar Washington Tabárez", number: "DT", team: "")
    
    private let uruguayNextMatches:[NextMatch] = [
        NextMatch(matchId: 1, versusTeam: "Rusia", versusTeamLogo: "Rusia", stadiumName: "Krestovsky", matchDate: "26/6"),
        NextMatch(matchId: 5, versusTeam: "Japón", versusTeamLogo: "Japon", stadiumName: "Kaliningrad", matchDate: "28/7")
    ]
    
    func getFixture() -> [Match] {
        //call API to get fixture data => now use dummy data.
        let match1 = Match(id: 1,
                           stadium:Stadium(identifier: 1, name: "Krestovsky", image: "Krestovsky"),
                           teamA: Team(id: 1, name: "Uruguay", logo: "Uruguay", players: uruguayPlayers, substitutePlayers: uruguaySubstitutePlayers, manager: uruguayManager, nextMatches: uruguayNextMatches),
                           teamB: Team(id: 2, name: "Rusia", logo: "Rusia", players: [], substitutePlayers: [], manager: Player(), nextMatches: []),
                           dateTime: "18 de Julio - 16:00",
                           played: true, teamAScore: 2, teamBScore: 1, group: "Grupo A")
        let match2 = Match(id: 2,
                           stadium:Stadium(identifier: 2, name: "Kaliningrad", image: "Krestovsky"),
                           teamA: Team(id: 3, name: "Brasil", logo: "Brasil", players: [], substitutePlayers: [], manager: Player(), nextMatches: []),
                           teamB: Team(id: 4, name: "España", logo: "Espania", players: [], substitutePlayers: [], manager: Player(), nextMatches: []),
                           dateTime: "19 de Julio - 20:00",
                           played: false, teamAScore: 0, teamBScore: 0, group: "Grupo B")
        let match3 = Match(id: 3,
                           stadium:Stadium(identifier: 3, name: "Nizhny Novgorod Stadium", image: "Krestovsky"),
                           teamA: Team(id: 5, name: "Portugal", logo: "Portugal", players: [], substitutePlayers: [], manager: Player(), nextMatches: []),
                           teamB: Team(id: 6, name: "Argentina", logo: "Argentina", players: [], substitutePlayers: [], manager: Player(), nextMatches: []),
                           dateTime: "20 de Julio - 15:00",
                           played: false, teamAScore: 0, teamBScore: 0, group: "Grupo C")
        let match4 = Match(id: 4,
                           stadium:Stadium(identifier: 3, name: "Samara Arena", image: "Krestovsky"),
                           teamA: Team(id: 7, name: "Alemania", logo: "Alemania", players: [], substitutePlayers: [], manager: Player(), nextMatches: []),
                           teamB: Team(id: 8, name: "Japón", logo: "Japon", players: [], substitutePlayers: [], manager: Player(), nextMatches: []),
                           dateTime: "21 de Julio - 19:30",
                           played: false, teamAScore: 0, teamBScore: 0, group: "Grupo D")
        let match5 = Match(id: 5,
                           stadium:Stadium(identifier: 3, name: "Kaliningrad", image: "Krestovsky"),
                           teamA: Team(id: 7, name: "Uruguay", logo: "Uruguay", players: uruguayPlayers, substitutePlayers: uruguaySubstitutePlayers, manager: uruguayManager, nextMatches: uruguayNextMatches),
                           teamB: Team(id: 8, name: "Japón", logo: "Japon", players: [], substitutePlayers: [], manager: Player(), nextMatches: []),
                           dateTime: "28 de Julio - 13:30",
                           played: false, teamAScore: 0, teamBScore: 0, group: "Grupo D")
        
        //populate array
        var fixture = [Match]()
        fixture = [match1, match2, match3, match4, match5]
        
        //return <Matches>
        return fixture
    }
    
    func getMatchDetails(matchId:Int) -> [MatchEvent] {
        var events = [MatchEvent]()
        switch matchId {
        case 1:
            let event1 = MatchEvent(team: "A", image: "Gol", player: "Luís Suarez", time: 25)
            let event2 = MatchEvent(team: "B", image: "Gol", player: "Aleksandr Kerzhakov", time: 50)
            let event3 = MatchEvent(team: "A", image: "YellowCard", player: "Diego Lugano", time: 62)
            let event4 = MatchEvent(team: "A", image: "Gol", player: "Edinson Cavani", time: 76)
            events = [event1, event2, event3, event4]
            break
        default:
            break
        }
        
        return events
    }
    
    func getMatchById(matchId:Int) -> Match? {
        //workaround for NextMatch class in collectionView
        for match in getFixture() {
            if (match.getMatchId() == matchId) {
                return match
            }
        }
        return nil
    }
}
