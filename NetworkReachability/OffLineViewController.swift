//
//  OffLineViewController.swift
//  NetworkReachability
//
//  Created by Petar Lemajic on 12/15/18.
//  Copyright © 2018 Petar Lemajic. All rights reserved.
//

import UIKit

class OffLineViewController: UIViewController {
    
    let network: NetworkManager = NetworkManager.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkForNetwork()
    }
    
    fileprivate func checkForNetwork() {
        network.reachability.whenReachable = {_ in
            self.showMainViewController()
        }
    }
    
    fileprivate func showMainViewController() {
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
            vc.show(vc, sender: self)
        }
    }
}
