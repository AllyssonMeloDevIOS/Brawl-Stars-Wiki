//
//  HomeViewModel.swift
//  Brawl Stars Wiki
//
//  Created by admin on 09/03/24.
//

import Foundation

protocol HomeViewModelProtocol: AnyObject {
    func success()
    func error(message: String)
}

class HomeViewModel {
    
    private var service: HomeService = HomeService()
//    private var brawlerList: [Brawler] = []
    private var brawlerlist: [BrawlerList] = []
    private var brawlerList : Brawler = []
    
    private weak var delegate: HomeViewModelProtocol?
    
    public func delegate(delegate: HomeViewModelProtocol?) {
        self.delegate = delegate
    }
    
    
    public func fetchRequest() {
        service.getBrawlerList { [weak self] result in
            guard let self else { return }
            switch result {

//            case .success(let success):
//                self.brawlerList = brawlerlist.brawler
//            case.success(let brawlerList):
//                self.brawlerList = brawlerList.brawler
            case.success(let result):
                self.brawlerList = result
                
                delegate?.success()
            case .failure(let failure):
                delegate?.error(message: failure.errorDescription ?? "")
            }
        }
    }
    public var numberOfRowsInSection: Int {
        return brawlerList.count
    }
    
    func loadCurrentBrawler(indexPath: IndexPath) -> BrawlerList {
        return brawlerList[indexPath.row]
    }

}

