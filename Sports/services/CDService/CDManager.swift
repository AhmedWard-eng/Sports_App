//
//  CDManager.swift
//  Sports
//
//  Created by Ahmed Ward on 24/05/2023.
//

import Foundation
import CoreData

class CDManager{
    private let appDelegate : AppDelegate
    private var managedContext : NSManagedObjectContext!
    
    var entityLeague : NSEntityDescription!
    
    
    init(appDelegate : AppDelegate){
        
        self.appDelegate = appDelegate
        managedContext = appDelegate.persistentContainer.viewContext
        
        entityLeague = NSEntityDescription.entity(forEntityName: "Leagues", in: managedContext)
        
    }
    
    
    func insert(leagueItem: League){
        let league = NSManagedObject(entity: entityLeague!, insertInto: managedContext)
        league.setValue(leagueItem.league_key, forKey: league_key)
        league.setValue(leagueItem.league_name, forKey: league_name)
        league.setValue(leagueItem.league_logo, forKey: league_logo)
        league.setValue(leagueItem.country_key, forKey: country_key)
        league.setValue(leagueItem.country_name, forKey: country_name)
        
        do{
            try managedContext.save()
        }catch let error as NSError{
            print(error.localizedDescription)
        }
//        releaseYear rating image genre
    }
    
    
//    func insert(listMovies : [Item]){
//        for movie in listMovies{
//            insert(movie: movie)
//        }
//    }

    func fetchLeague() -> [League]{
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Leagues")
        
        var leagues: [NSManagedObject] = []
        var leaguesData : [League] = []
        
        do{
            leagues = try managedContext.fetch(fetchRequest)
        }catch let error as NSError{
            print(error.localizedDescription)
        }
        
        for league in leagues{
            let leagueData = League()
            
            leagueData.league_key = league.value(forKey:league_key) as? Int
            leagueData.country_name = league.value(forKey: country_name) as? String
            leagueData.league_name = league.value(forKey: league_name) as? String
            leagueData.league_logo = league.value(forKey: league_logo) as? String
            leagueData.country_key = league.value(forKey: country_key) as? Int
            
            
            leaguesData.append(leagueData)
            
        }
        return leaguesData
    }

    
    func removeLeague(leagueData : League){
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
    
   private func fetchLeague(league_key key : Int) -> [League]{
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Leagues")
        
       let predict = NSPredicate(format: "league_key == %@", NSNumber(value: key))
        fetchRequest.predicate = predict
        
        var leagues : [NSManagedObject] = []
        var leaguesData : [League] = []
        
        do{
            leagues = try managedContext.fetch(fetchRequest)
        }catch let error as NSError{
            print(error.localizedDescription)
        }
        for league in leagues{
            let leagueData = League()
            
            leagueData.league_key = league.value(forKey:league_key) as? Int
            leagueData.country_name = league.value(forKey: country_name) as? String
            leagueData.league_name = league.value(forKey: league_name) as? String
            leagueData.league_logo = league.value(forKey: league_logo) as? String
            leagueData.country_key = league.value(forKey: country_key) as? Int
            
            
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
