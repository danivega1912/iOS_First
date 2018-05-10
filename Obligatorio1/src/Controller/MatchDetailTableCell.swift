//
//  MatchDetailTableCell.swift
//  Obligatorio1
//
//  Created by Daniel Vega on 4/29/18.
//  Copyright © 2018 Daniel Vega. All rights reserved.
//

import UIKit

class MatchDetailTableCell: UITableViewCell {

    @IBOutlet weak var teamAEventImage: UIImageView!
    @IBOutlet weak var teamAEventNameLabel: UILabel!
    @IBOutlet weak var eventTimeLabel: UILabel!
    @IBOutlet weak var teamBEventImage: UIImageView!
    @IBOutlet weak var teamBEventNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
