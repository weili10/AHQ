//
//  FeedTableViewCell.swift
//  Athlete.HQ
//
//  Created by Wei Li on 13/3/18.
//  Copyright © 2018 Wei Li. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var FeedCellImageView: UIImageView!
    @IBOutlet weak var FeedCellNameLabel: UILabel!
    @IBOutlet weak var FeedCellTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
