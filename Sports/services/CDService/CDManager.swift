//
//  CDManager.swift
//  Sports
//
//  Created by Ahmed Ward on 24/05/2023.
//

import Foundation
import CoreData



protocol DataBaseProtocol {
    
    func insert(leagueItem: LeagueDTO)

    func fetchLeague() -> [LeagueDTO]
    
    func removeLeague(leagueData : LeagueDTO)
    
    func removeAll()
    
    func isExistedInFav(league_key: Int) -> Bool
}
class CDManager :DataBaseProtocol{
    private let appDelegate : AppDelegate
    private var managedContext : NSManagedObjectContext!
    
    var entityLeague : NSEntityDescription!
    
    
    init(appDelegate : AppDelegate){
        
        self.appDelegate = appDelegate
        managedContext = appDelegate.persistentContainer.viewContext
        
        entityLeague = NSEntityDescription.entity(forEntityName: "Leagues", in: managedContext)
        
    }
    
    
    func insert(leagueItem: LeagueDTO){
        let league = NSManagedObject(entity: entityLeague!, insertInto: managedContext)
        league.setValue(leagueItem.league_key, forKey: league_key)
        league.setValue(leagueItem.league_name, forKey: league_name)
        league.setValue(leagueItem.league_logo, forKey: league_logo)
        league.setValue(leagueItem.country_key, forKey: country_key)
        league.setValue(leagueItem.country_name, forKey: country_name)
        league.setValue(leagueItem.sportType?.rawValue, forKey: sports_type)
        
        do{
            try managedContext.save()
        }catch let error as NSError{
            print(error.localizedDescription)
        }
    }
    
    


    func fetchLeague() -> [LeagueDTO]{
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Leagues")
        
        var leagues: [NSManagedObject] = []
        var leaguesData : [LeagueDTO] = []
        
        do{
            leagues = try managedContext.fetch(fetchRequest)
        }catch let error as NSError{
            print(error.localizedDescription)
        }
        
        for league in leagues{
            let leagueData = LeagueDTO(
                league_key: league.value(forKey:league_key) as? Int,
                league_name: league.value(forKey: league_name) as? String,
                league_logo: league.value(forKey: league_logo) as? String,
                country_key: league.value(forKey: country_key) as? Int,
                country_name: league.value(forKey: country_name) as? String,
                sportType: Sports.init(rawValue: league.value(forKey: sports_type) as! String) ?? .football)
            
            leaguesData.append(leagueData)
            
        }
        return leaguesData
    }

    
    func removeLeague(leagueData : LeagueDTO){
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Leagues")
        let predict = NSPredicate(format: "league_key == %@", NSNumber(value: leagueData.league_key ?? 0))
        
        fetchRequest.predicate = predict
        
        var leagues : [NSManagedObject] = []
        
        do{
            leagues = try managedContext.fetch(fetchRequest)
            guard let removedObject = leagues.first else{
                return
            }
            managedContext.delete(removedObject)
            
            
           try managedContext.save()
        }catch let error as NSError{
            print(error.localizedDescription)
        }
        
    }
    
    func removeAll(){
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Leagues")
        
        var leagues : [NSManagedObject] = []
        
        do{
            leagues = try managedContext.fetch(fetchRequest)
            for movie in leagues {
                managedContext.delete(movie)
            }
            
            
           try managedContext.save()
        }catch let error as NSError{
            print(error.localizedDescription)
        }
    }
    
   private func fetchLeague(league_key key : Int) -> [LeagueDTO]{
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Leagues")
        
       let predict = NSPredicate(format: "league_key == %@", NSNumber(value: key))
        fetchRequest.predicate = predict
       
        
        var leagues : [NSManagedObject] = []
        var leaguesData : [LeagueDTO] = []
        
        do{
            leagues = try managedContext.fetch(fetchRequest)
        }catch let error as NSError{
            print(error.localizedDescription)
        }
        for league in leagues{
            let leagueData = LeagueDTO(
                league_key: league.value(forKey:league_key) as? Int,
                league_name: league.value(forKey: league_name) as? String,
                league_logo: league.value(forKey: league_logo) as? String,
                country_key: league.value(forKey: country_key) as? Int,
                country_name: league.value(forKey: country_name) as? String,
                sportType: Sports.init(rawValue: league.value(forKey: sports_type) as! String) ?? .football)
            
            
            leaguesData.append(leagueData)
            
        }
        
        return leaguesData
    }
    
    func isExistedInFav(league_key: Int) -> Bool{
        var fav = fetchLeague(league_key: league_key)
        
        if fav.count > 0{
            return true
        }
        return false
    }
    
    
}





public let league_key = "league_key"
public let league_name = "league_name"
public let league_logo = "league_logo"
public let country_key = "country_key"
public let country_name = "country_name"
public let sports_type = "sports_type"
