//
//  FlagColorsTableViewCell.swift
//  TriviaApp
//
//  Created by Kasun on 10/29/1399 AP.
//

import UIKit

class FlagColorsTableViewCell: UITableViewCell {

    @IBOutlet weak var checkbox: UIImageView!
    @IBOutlet weak var flagColor: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
