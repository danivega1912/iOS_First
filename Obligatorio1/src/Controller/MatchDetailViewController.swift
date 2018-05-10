//
//  MatchDetailViewController.swift
//  Obligatorio1
//
//  Created by Daniel Vega on 4/29/18.
//  Copyright © 2018 Daniel Vega. All rights reserved.
//

import UIKit

class MatchDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var stadiumImage: UIImageView!
    @IBOutlet weak var stadiumNameLabel: UILabel!
    @IBOutlet weak var matchDetailTableView: UITableView!
    @IBOutlet weak var teamAImage: UIImageView!
    @IBOutlet weak var teamBImage: UIImageView!
    @IBOutlet weak var teamAName: UILabel!
    @IBOutlet weak var teamBName: UILabel!
    @IBOutlet weak var matchDateTimeLabel: UILabel!
    
    var matchId:Int = 0
    var matchInfo:Match?
    var matchEvents:[MatchEvent] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigation bar
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
        self.navigationItem.title = (matchInfo?.getTeamA().getName().prefix(3).uppercased())! + " v " + (matchInfo?.getTeamB().getName().prefix(3).uppercased())!
        
        //data
        stadiumImage.image = UIImage(named: (matchInfo?.getStadium().getImage())!)
        stadiumNameLabel.text = matchInfo?.getStadium().getName()
        teamAImage.image = UIImage(named: (matchInfo?.getTeamA().getLogo())!)
        teamAName.text = (matchInfo?.getTeamA().getName())! +
            ((matchInfo?.getPlayed())! ? " - " + (matchInfo?.getTeamAScore().description)! : "")
        teamBImage.image = UIImage(named: (matchInfo?.getTeamB().getLogo())!)
        teamBName.text = (matchInfo?.getTeamB().getName())! +
            ((matchInfo?.getPlayed())! ? " - " + (matchInfo?.getTeamBScore().description)! : "")
        matchDateTimeLabel.text = matchInfo?.getMatchDateTime()
        //winner -> Bold
        if (matchInfo?.getPlayed())!{
            if ((matchInfo?.getTeamAScore())! > (matchInfo?.getTeamBScore())!) {
                teamAName.font = UIFont.boldSystemFont(ofSize: 17)
            } else if ((matchInfo?.getTeamAScore())! < (matchInfo?.getTeamBScore())!) {
                teamBName.font = UIFont.boldSystemFont(ofSize: 17)
            }
        }
        
        //events?
        if (matchInfo?.getPlayed())! {
            let dataManager = DataManager()
            matchEvents = dataManager.getMatchDetails(matchId: (matchInfo?.getMatchId())!)
        }
        
        //for TableView
        matchDetailTableView.delegate = self
        matchDetailTableView.dataSource = self
        matchDetailTableView.rowHeight = 28
        matchDetailTableView.reloadData()
        
        //tap gesture over images
        let tapGestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        teamAImage.isUserInteractionEnabled = true
        teamBImage.isUserInteractionEnabled = true
        teamAImage.addGestureRecognizer(tapGestureRecognizer1)
        teamBImage.addGestureRecognizer(tapGestureRecognizer2)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:MatchDetailTableCell?
        cell = tableView.dequeueReusableCell(withIdentifier: "MatchDetailCell", for: indexPath) as? MatchDetailTableCell
        
        if (matchEvents[indexPath.item].getTeam() == "A") {
            cell?.teamAEventImage.image = UIImage(named: matchEvents[indexPath.item].getImage())
            cell?.teamAEventNameLabel.text = matchEvents[indexPath.item].getPlayer()
            cell?.teamBEventNameLabel.text = ""
            cell?.teamBEventImage.image = nil
        } else {
            cell?.teamBEventImage.image = UIImage(named: matchEvents[indexPath.item].getImage())
            cell?.teamBEventNameLabel.text = matchEvents[indexPath.item].getPlayer()
            cell?.teamAEventNameLabel.text = ""
            cell?.teamAEventImage.image = nil
        }
        cell?.eventTimeLabel.text = matchEvents[indexPath.item].getTime() + "'"
        
        //background color
        if (indexPath.item % 2 == 0) {
            cell?.backgroundColor = UIColor.groupTableViewBackground
        } else {
            cell?.backgroundColor = UIColor.white
        }
        
        return cell!
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let teamDetailVC:TeamDetailViewController = self.storyboard!.instantiateViewController(withIdentifier: "TeamDetailStoryBoard") as! TeamDetailViewController
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        if (tappedImage.tag == 0) {
            teamDetailVC.team = (matchInfo?.getTeamA())!
        } else {
            teamDetailVC.team = (matchInfo?.getTeamB())!
        }
        navigationController?.show(teamDetailVC, sender: self)
    }

}
