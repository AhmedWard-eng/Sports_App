//
//  TeamsViewController.swift
//  Sports
//
//  Created by Ahmed Ward on 24/05/2023.
//

import UIKit
import Kingfisher

class TeamsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    
    
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamLogo: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    var team : Teams!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        setImageUsingKF(team.team_logo, teamLogo)
        teamNameLabel.text = team.team_name
        
        
        
    }
    
    
    
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return team.players?.count ?? 0
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath) as! TeamTableViewCell
        let item = team.players?[indexPath.row]
        
        
        cell.setTeamData(url: item?.player_image , teamName: item?.player_name)
        
        return cell
    }
    
    
    fileprivate func setImageUsingKF(_ url: String?, _ image: UIImageView) {
        if let url = URL(string: url ?? "") {
            KF.url(url)
            //                .placeholder(UIImage(named: placeHolder))
                .cacheMemoryOnly()
                .fade(duration: 0.25)
                .set(to: image)
        }else{
            //            cell.leagueImg.image = UIImage(named: placeHolder)
        }
    }
}
