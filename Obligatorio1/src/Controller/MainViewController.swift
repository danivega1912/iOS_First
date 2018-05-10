//
//  MainViewController.swift
//  Obligatorio1
//
//  Created by Daniel Vega on 4/29/18.
//  Copyright © 2018 Daniel Vega. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var MainTableView: UITableView!
    
    private var fixture:[Match] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigation bar
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
        self.navigationItem.title = "UCU World Cup"
        
        //instanciate DataManager => get fixture
        let dataManager = DataManager()
        fixture = dataManager.getFixture()
        
        //TableView
        MainTableView.delegate = self
        MainTableView.dataSource = self
        self.MainTableView.rowHeight = 160
        MainTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fixture.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:MatchTableViewCell?
        cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as? MatchTableViewCell
        
        //cell data
        cell?.dateTimeMatchLabel.text = fixture[indexPath.item].getMatchDateTime()
        cell?.stadiumMatchLabel.text = fixture[indexPath.item].getStadium().getName()
        cell?.groupMatchLabel.text = fixture[indexPath.item].getGroup()
        cell?.teamAImage.image = UIImage(named: fixture[indexPath.item].getTeamA().getLogo())
        cell?.teamANameLabel.text = fixture[indexPath.item].getTeamA().getName() + (fixture[indexPath.item].getPlayed() ? " - " + String(fixture[indexPath.item].getTeamAScore()) : "")
        cell?.teamBImage.image = UIImage(named: fixture[indexPath.item].getTeamB().getLogo())
        cell?.teamBNameLabel.text = (fixture[indexPath.item].getPlayed() ? String(fixture[indexPath.item].getTeamBScore()) + " - " : "") + fixture[indexPath.item].getTeamB().getName()
        
        //winner -> Bold
        if (fixture[indexPath.item].getPlayed()) {
            if (fixture[indexPath.item].getTeamAScore() > fixture[indexPath.item].getTeamBScore()) {
                cell?.teamANameLabel.font = UIFont.boldSystemFont(ofSize: 17)
            } else if (fixture[indexPath.item].getTeamAScore() < fixture[indexPath.item].getTeamBScore()) {
                cell?.teamBNameLabel.font = UIFont.boldSystemFont(ofSize: 17)
            }
        }
        
        //return cell
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let matchDetailVC:MatchDetailViewController = self.storyboard!.instantiateViewController(withIdentifier: "MatchDetailStoryBoard") as! MatchDetailViewController
        //set match
        matchDetailVC.matchInfo = fixture[indexPath.item]
        MainTableView.deselectRow(at: indexPath, animated: true)
        navigationController?.show(matchDetailVC, sender: self)
    }

}
