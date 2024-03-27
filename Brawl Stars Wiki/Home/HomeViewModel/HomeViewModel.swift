//
//  HomeViewModel.swift
//  Brawl Stars Wiki
//
//  Created by admin on 09/03/24.
//

import Foundation


class HomeViewModel {
    
    private var brawlerList: [Brawler] = []
    
    public var numberOfRowsInSection: Int {
        return brawlerList.count
        
//        public func fetchRequest() {
//            
//        }
        
    }
    
    func loadCurrentBrawler(indexPath: IndexPath) -> Brawler {
        return brawlerList[indexPath.row]
    }
    
}

