//
//  TeamDetailTableCell.swift
//  Obligatorio1
//
//  Created by Daniel Vega on 5/2/18.
//  Copyright © 2018 Daniel Vega. All rights reserved.
//

import UIKit

class TeamDetailTableCell: UITableViewCell {

    @IBOutlet weak var playerNumberLabel: UILabel!
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerCurrentTeamLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }


}
