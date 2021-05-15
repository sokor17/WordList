//
//  ListTableViewCell.swift
//  WordList
//
//  Created by Yu Kono on 2021/05/15.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    @IBOutlet var englishLabel:UILabel!
    @IBOutlet var japaneseLabel:UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
