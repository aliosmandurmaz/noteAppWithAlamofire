//
//  NotHucreTableViewCell.swift
//  NotUygulamasi
//
//  Created by Ali Osman DURMAZ on 18.03.2022.
//

import UIKit

class NotHucreTableViewCell: UITableViewCell {

    @IBOutlet weak var labelDersAdi: UILabel!;
    
    @IBOutlet weak var labelNot1: UILabel!;
    
    @IBOutlet weak var labelNot2: UILabel!;
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
