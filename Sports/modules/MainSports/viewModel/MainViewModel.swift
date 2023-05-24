//
//  MainViewModel.swift
//  Sports
//
//  Created by Ahmed Ward on 20/05/2023.
//

import Foundation
class MainViewModel{
    
    var bindResultToViewController : (()->()) = {}
//    var result : [Item]!{
//        didSet{
//            bindResultToViewController()
//        }
//    }
    
    init(){
        getItems()
    }
    
    func getItems(){
//        NetworkManager.loadData { [weak self] (result : MyResult?) in
//            print(result?.items[0].header ?? "")
//            self?.result = result?.items
////                DispatchQueue.main.async {
////                    self?.view.renderTableView()
////                }
//        }
    }
}
