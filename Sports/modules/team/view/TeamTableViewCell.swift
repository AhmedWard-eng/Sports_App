//
//  TeamTableViewCell.swift
//  Sports
//
//  Created by Ahmed Ward on 24/05/2023.
//

import UIKit
import Kingfisher
class TeamTableViewCell: UITableViewCell {

    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var teamImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setTeamData(url:String?,teamName: String?){
        setImageUsingKF(url, teamImage)
        teamLabel.text = teamName
    }
    
    fileprivate func setImageUsingKF(_ url: String?, _ image: UIImageView) {
        if let url = URL(string: url ?? "") {
            KF.url(url)
            // .placeholder(UIImage(named: placeHolder))
                .cacheMemoryOnly()
                .fade(duration: 0.25)
                .set(to: image)
        }else{
            //            cell.leagueImg.image = UIImage(named: placeHolder)
        }
    }
    

}
