//
//  GamesListTableViewCell.swift
//  TriviaApp
//
//  Created by Kasun on 10/29/1399 AP.
//

import UIKit

class GamesListTableViewCell: UITableViewCell {

    @IBOutlet weak var dateTime: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var bestcricketerName: UILabel!
    @IBOutlet weak var flagColors: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
