//
//  TeamDetailViewController.swift
//  Obligatorio1
//
//  Created by Daniel Vega on 5/2/18.
//  Copyright © 2018 Daniel Vega. All rights reserved.
//

import UIKit

class TeamDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var teamLogoImageView: UIImageView!
    @IBOutlet weak var teamPlayersTableView: UITableView!
    @IBOutlet weak var NextMatchCollectionView: UICollectionView!
    
    var team = Team()

    override func viewDidLoad() {
        super.viewDidLoad()
        //navigation bar
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
        self.navigationItem.title = team.getName()

        //logo
        teamLogoImageView.image = UIImage(named: team.getLogo())
        
        //TableView
        teamPlayersTableView.delegate = self
        teamPlayersTableView.dataSource = self
        teamPlayersTableView.rowHeight = 60
        teamPlayersTableView.reloadData()
        
        //CollectionView
        NextMatchCollectionView.delegate = self
        NextMatchCollectionView.dataSource = self
        NextMatchCollectionView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return team.getPlayersSections().count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return team.getPlayersSections()[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Players"
        case 1:
            return "Substitutes"
        case 2:
            return "Manager"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:TeamDetailTableCell?
        cell = tableView.dequeueReusableCell(withIdentifier: "TeamDetailCell", for: indexPath) as? TeamDetailTableCell
        cell?.playerNumberLabel.text = team.getPlayersSections()[indexPath.section][indexPath.item].getNumber()
        cell?.playerNameLabel.text = team.getPlayersSections()[indexPath.section][indexPath.item].getName()
        cell?.playerCurrentTeamLabel.text = team.getPlayersSections()[indexPath.section][indexPath.item].getTeam()
        return cell!
    }
    
    /* -----  Collection View --- */
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return team.getNextMatches().count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let nextMatchCell:NextMatchCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "NextMatchCell", for: indexPath) as! NextMatchCollectionViewCell

        nextMatchCell.layer.cornerRadius = 10
        nextMatchCell.layer.masksToBounds = true
        
        nextMatchCell.teamNameLabel.text = team.getNextMatches()[indexPath.item].getVersusTeam()
        nextMatchCell.matchDateTimeLabel.text = team.getNextMatches()[indexPath.item].getMatchDate()
        nextMatchCell.matchStadiumLabel.text = team.getNextMatches()[indexPath.item].getStadiumName()
        nextMatchCell.teamLogoImage.image = UIImage(named: team.getNextMatches()[indexPath.item].getVersusTeamLogo())
        
        return nextMatchCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dm:DataManager = DataManager()
        let matchDetailVC:MatchDetailViewController = self.storyboard!.instantiateViewController(withIdentifier: "MatchDetailStoryBoard") as! MatchDetailViewController
        //set match
        matchDetailVC.matchInfo = dm.getMatchById(matchId: team.getNextMatches()[indexPath.item].getMatchId())
        navigationController?.show(matchDetailVC, sender: self)
    }

}
