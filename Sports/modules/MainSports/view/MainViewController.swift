//
//  ViewController.swift
//  Sports
//
//  Created by Ahmed Ward on 20/05/2023.
//

import UIKit
import Reachability

class Sport{
    var title : String
    var image : String
    var sportType: Sports
    
    init(title: String, image: String,sportType : Sports) {
        self.title = title
        self.image = image
        self.sportType = sportType
    }
}

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    var list : [Sport] =  [
        Sport(title: "Football", image: "football",sportType: Sports.football),
        Sport(title: "Basketball", image: "basketball",sportType: Sports.basketball),
        Sport(title: "Tennis", image: "tennis",sportType: Sports.tennis),
        Sport(title: "Cricket", image: "cricket",sportType: Sports.cricket)
    ]
    
    let reachability = try! Reachability()
    
    

    

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
//        collectionView.
//        NetworkService.getLeague(sportName: "football") { l in
//            print(l?.result[3].league_name)
//        }
//
//        NetworkService.getTeamDetails(sportName: "football", teamId: 252){ l in
//            print(l?.result[0].players?[0].player_name)
//        }
//
//        NetworkService.getTeams(sportName: "football", leagueId: 302) { l in
//
//            print(l!.result.count)
//        }
//
//        NetworkService.getLatestEvents(sportName: "football", leagueId: 3) { l in
//            print(l?.result[0].event_date)
//        }
//
//        NetworkService.getUpComingEvents(sportName: "football", leagueId: 3) { l in
//            print(l?.result[0].event_away_team)
//        }
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        return CGSize(width: (width - 38) / 2 , height: height / 5)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sportsCell", for: indexPath) as! MainSportsCollectionViewCell
        cell.sportName.text = list[indexPath.row].title
        cell.SportImg.image = UIImage(named: list[indexPath.row].image)
        
    
    
        
        
        cell.width.constant = (width - 38) / 2
        cell.height.constant = (height) / 2.7
    
        
        
        cell.contentView.layer.cornerRadius = 32.0
        cell.contentView.layer.masksToBounds = true
        cell.layer.cornerRadius = 32.0
        cell.layer.masksToBounds = false
        
        // Configure the cell
    
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if reachability.connection != .unavailable {
            let viewController = self.storyboard?.instantiateViewController(withIdentifier: "league") as! LeagueTableViewController
            viewController.sportType = list[indexPath.row].sportType
            navigationController?.pushViewController(viewController, animated: true)
            
        }else{
            let alert = UIAlertController(title: "Network is Unreachable!!", message: "Please, Check Your Internet Then Try Again", preferredStyle: UIAlertController.Style.actionSheet)
                        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                        alert.addAction(action)
                        self.present(alert, animated: true)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
 
            if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as? SportsHeader{
                
                sectionHeader.header.text = "Sports"
                
                return sectionHeader
            }
            return UICollectionReusableView()
        }


}

