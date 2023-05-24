//
//  LeagueTableViewController.swift
//  Sports
//
//  Created by Ahmed Ward on 21/05/2023.
//

import UIKit

import Kingfisher

class LeagueTableViewController: UITableViewController {
    
    let viewModel = LeagueViewModel()
    
    var sportType = Sports.football
    
    var leagues : [League]?
    
    var placeHolder = "footballTrophy"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getLeagues(sportName: sportType.rawValue)
        
        viewModel.bindResultToViewController = {[weak self] in
            self?.leagues = self?.viewModel.result.result
            self?.tableView.reloadData()
        }
        
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "leagueCell")
        
        switch(sportType){
        case .football:
            placeHolder = "footballTrophy"
            break;
        case .basketball:
            placeHolder = "basketballTrophy"
            break;
        case .tennis:
            placeHolder = "tennisTrophy"
            break;
        case .cricket:
            placeHolder = "cricketTrophy"
            break;
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return leagues?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leagueCell", for: indexPath) as! LeagueTableViewCell
        if let item = leagues?[indexPath.row]{
            cell.leagueName.text = item.league_name
            
            cell.leagueImg.layer.borderWidth = 1
            cell.leagueImg.layer.masksToBounds = false
            cell.leagueImg.layer.borderColor = UIColor.black.cgColor
            cell.leagueImg.layer.cornerRadius = cell.leagueImg.frame.height/2
            cell.leagueImg.clipsToBounds = true
            
            if let url = URL(string: item.league_logo ?? "") {
                KF.url(url)
                    .placeholder(UIImage(named: placeHolder))
                    .cacheMemoryOnly()
                    .fade(duration: 0.25)
                    .set(to: cell.leagueImg)
            }else{
                cell.leagueImg.image = UIImage(named: placeHolder)
            }
            
        }
        
        
        // Configure the cell...
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "leagueDetails") as! LDetailsCollectionViewController
        viewController.sportType = sportType
        viewController.leagueId = leagues?[indexPath.row].league_key
        viewController.league = leagues?[indexPath.row]
//        navigationController?.pushViewController(viewController, animated: true)
        
        
        
            viewController.modalPresentationStyle = .fullScreen
                //        leagueDetails.modalTransitionStyle = .crossDissolve
                
                present(viewController, animated: true)
    }
    
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
