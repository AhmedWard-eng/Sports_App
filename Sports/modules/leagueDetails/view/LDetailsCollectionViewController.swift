//
//  CollectionViewController.swift
//  Sports
//
//  Created by Ahmed Ward on 23/05/2023.
//

import UIKit
import Kingfisher

class LDetailsCollectionViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {

    var viewModel : LDetailsViewModel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    var sportType = Sports.football
    var leagueId : Int!
    var league: League!
    
    @IBOutlet weak var favButton: UIBarButtonItem!
    
    var cdManager = CDManager(appDelegate: UIApplication.shared.delegate as! AppDelegate)
    
    var upcomingEvent : [UpCommingEvent]?
    var teams : [Teams]?
    var latest : [LatestEvents]?
    
    @IBAction func addToFav(_ sender: Any) {
        if viewModel.isExistedInFav (league_key: leagueId){
            viewModel.removeFromFav(league: league)
            favButton.image = UIImage(systemName: "heart")
        }else{
            viewModel.addToFav(league: league)
            
            favButton.image =  UIImage(systemName: "heart.fill")
        }
    }
    @IBAction func backClick(_ sender: Any) {
        dismiss(animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = LDetailsViewModel(cdManager:  cdManager)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        // self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        
        if viewModel.isExistedInFav (league_key: leagueId){
            favButton.image = UIImage(systemName: "heart.fill")
        }else{
            favButton.image =  UIImage(systemName: "heart")
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        viewModel.bindUpcomingToViewController = { [weak self] in
            self?.upcomingEvent = self?.viewModel.upcomingResult?.result
            self?.collectionView.reloadData()
        }
        
        viewModel.bindLatestToViewController = { [weak self] in
            self?.latest = self?.viewModel.latestResult?.result
            self?.collectionView.reloadData()
        }
        
        viewModel.bindTeamsToViewController = { [weak self] in
            self?.teams = self?.viewModel.teamsResult?.result
            self?.collectionView.reloadData()
//            print(self?.teams?[0].team_name)
        }
        
        viewModel.getLeagueData(sportName: sportType.rawValue, leagueId: leagueId)
        let layout = UICollectionViewCompositionalLayout{index, environment in
            switch (index){
            case 0: return self.drawTheUpcomingSection()
            case 1: return self.drawTheLatestSection()
            default: return self.drawTheTeamsSection()
            }
        }
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    func drawTheUpcomingSection() -> NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension:  .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 32)
        let section = NSCollectionLayoutSection(group: group)
        
        section.orthogonalScrollingBehavior = .continuous
        
        section.contentInsets = NSDirectionalEdgeInsets(top: 100, leading: 16, bottom: 16, trailing: 0)
        
        section.visibleItemsInvalidationHandler = { (items, offset, environment) in
            items.forEach { item in
                let distanceFromCenter = abs((item.frame.midX - offset.x) - environment.container.contentSize.width / 2.0)
                let minScale: CGFloat = 0.8
                let maxScale: CGFloat = 1.0
                let scale = max(maxScale - (distanceFromCenter / environment.container.contentSize.width), minScale)
                item.transform = CGAffineTransform(scaleX: scale, y: scale)
            }
        }
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(25))
                let headerSupplementary = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                
                section.boundarySupplementaryItems = [headerSupplementary]
        
        return section
    }
    
    func drawTheLatestSection() -> NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension:  .absolute(200))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 32)
        let section = NSCollectionLayoutSection(group: group)
//         section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 100, leading: 16, bottom: 16, trailing: 0)
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(25))
                let headerSupplementary = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                
                section.boundarySupplementaryItems = [headerSupplementary]
        
        return section
    }
    
    func drawTheTeamsSection() -> NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension:  .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 32)
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 100, leading: 16, bottom: 16, trailing: 0)
        
        section.visibleItemsInvalidationHandler = { (items, offset, environment) in
            items.forEach { item in
                let distanceFromCenter = abs((item.frame.midX - offset.x) - environment.container.contentSize.width / 2.0)
                let minScale: CGFloat = 0.8
                let maxScale: CGFloat = 1.0
                let scale = max(maxScale - (distanceFromCenter / environment.container.contentSize.width), minScale)
                item.transform = CGAffineTransform(scaleX: scale, y: scale)
            }
        }
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(25))
                let headerSupplementary = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                
                section.boundarySupplementaryItems = [headerSupplementary]
        
        return section
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            
            if kind == UICollectionView.elementKindSectionHeader {
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! CollectionReusableView
//                header.content
                if indexPath.section == 0 {
                    
                    header.label.text = "Up Coming Events"
                }else if indexPath.section == 1{
                    header.label.text = "Latest Results"
                }else{
                    header.label.text = "Teams"
                }
                
                return header
            }
            return UICollectionReusableView()
        }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        switch (section){
            
        case 0: return upcomingEvent?.count ?? 0
        case 1: return latest?.count ?? 0
        case 2: return teams?.count ?? 0
        default: return 0
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch (indexPath.section){
        case 0: return upcomingEventCell(indexPath: indexPath)
        case 1: return latestEventsCell(indexPath: indexPath)
        default: return teamsCell(indexPath: indexPath)
            
        }
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
    
    func upcomingEventCell(indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upcomingCell", for: indexPath) as! UpcomingCollectionViewCell
        let item = upcomingEvent?[indexPath.row]
        
        cell.homeLabel.text = item?.event_home_team
        cell.awayLabel.text = item?.event_away_team
        cell.dateLabel.text = item?.event_date
        cell.timeLabel.text = item?.event_time
        
        setImageUsingKF(item?.home_team_logo, cell.homeImage)
        
        setImageUsingKF(item?.away_team_logo, cell.awayImage)
        
        // Configure the cell
        
        return cell
    }
    
    func latestEventsCell(indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "latestCell", for: indexPath) as! LatestCollectionViewCell
        let item = latest?[indexPath.row]
        
        cell.homeLabel.text = item?.event_home_team
        cell.awayLabel.text = item?.event_away_team
        cell.dateLabel.text = item?.event_date
        cell.timeLabel.text = item?.event_time
        cell.resultLabel.text = item?.event_final_result
        
        setImageUsingKF(item?.home_team_logo, cell.homeImage)
        
        setImageUsingKF(item?.away_team_logo, cell.awayImage)
        // Configure the cell
        
        return cell
    }
    
    func teamsCell(indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamCell", for: indexPath) as! TeamCollectionViewCell
        let item = teams?[indexPath.row]
        cell.teamNameLabel.text = item?.team_name
        
        setImageUsingKF(item?.team_logo, cell.teamImg)
        // Configure the cell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.size.width
//        let height = UIScreen.main.bounds.size.height
        
        return CGSize(width: (width - 20) / 2 , height: (width - 20) / 2)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 2 {
            let viewController = self.storyboard?.instantiateViewController(withIdentifier: "teams") as! TeamsViewController
            let team = teams?[indexPath.row]
            if team != nil {
                viewController.team =  team
                viewController.modalPresentationStyle = .fullScreen
                    
                    present(viewController, animated: true)
            }
        }
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
