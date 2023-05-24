//
//  TableViewCell.swift
//  Sports
//
//  Created by Ahmed Ward on 23/05/2023.
//

import UIKit

class LeagueTableViewCell: UITableViewCell {

    @IBOutlet weak var leagueName: UILabel!
    @IBOutlet weak var leagueImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Define the desired padding
        let padding = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        // Adjust the content view frame
        contentView.frame = contentView.frame.inset(by: padding)
        
        contentView.layer.cornerRadius = 32.0
        contentView.layer.masksToBounds = true
        layer.cornerRadius = 32.0
        layer.masksToBounds = false
    }
    
}
