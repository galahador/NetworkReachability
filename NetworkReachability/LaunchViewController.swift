//
//  ViewController.swift
//  NetworkReachability
//
//  Created by Petar Lemajic on 12/15/18.
//  Copyright © 2018 Petar Lemajic. All rights reserved.
//

import UIKit

class LaunchViewController: UIViewController {

    let network: NetworkManager = NetworkManager.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        checkForReachability()
    }

    fileprivate func checkForReachability() {
        offlineMode()
        onlineMode()
    }

    fileprivate func onlineMode() {
        NetworkManager.isReachable { _ in
            self.showMainViewController()
        }
    }

    fileprivate func offlineMode() {
        NetworkManager.isUnreachable { _ in
            self.showOfflineController()
        }
    }

    fileprivate func showOfflineController() {
        DispatchQueue.main.async {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "OffLineViewController") as! OffLineViewController
            vc.show(vc, sender: self)
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

