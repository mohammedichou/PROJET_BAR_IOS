//
//  BarTableViewCell.swift
//  search_bar
//
//  Created by mohammed ichou on 24/11/2018.
//  Copyright © 2018 mohammed ichou. All rights reserved.
//

import UIKit

class BarTableViewCell: UITableViewCell {
    @IBOutlet weak var ImageBar: UIImageView!
    @IBOutlet weak var LabelText: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        

        // Configure the view for the selected state
    }
    

}
