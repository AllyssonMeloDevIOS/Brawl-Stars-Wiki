//
//  BrawlerVC.swift
//  Brawl Stars Wiki
//
//  Created by admin on 03/03/24.
//

import UIKit

class BrawlerVC: UIViewController {

    var brawlerScreen: BrawlerScreen?
    
    override func loadView() {
        brawlerScreen = BrawlerScreen()
        view = brawlerScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
