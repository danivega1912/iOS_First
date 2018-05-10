//
//  MatchTableViewCell.swift
//  Obligatorio1
//
//  Created by Daniel Vega on 4/29/18.
//  Copyright © 2018 Daniel Vega. All rights reserved.
//

import UIKit

class MatchTableViewCell: UITableViewCell {

    @IBOutlet weak var dateTimeMatchLabel: UILabel!
    @IBOutlet weak var stadiumMatchLabel: UILabel!
    @IBOutlet weak var groupMatchLabel: UILabel!
    
    @IBOutlet weak var teamAImage: UIImageView!
    @IBOutlet weak var teamANameLabel: UILabel!
    @IBOutlet weak var teamBImage: UIImageView!
    @IBOutlet weak var teamBNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
