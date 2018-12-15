//
//  NetworkManager.swift
//  NetworkReachability
//
//  Created by Petar Lemajic on 12/15/18.
//  Copyright © 2018 Petar Lemajic. All rights reserved.
//

import Foundation
import Reachability

class NetworkManager: NSObject {
    var reachability: Reachability!

    static let sharedInstance: NetworkManager = {
        return NetworkManager()
    }()

    override init() {
        super.init()
        reachability = Reachability()!

        NotificationCenter.default.addObserver(self, selector: #selector(networkStatusChanged(_:)), name: .reachabilityChanged, object: reachability)

        do {
            try reachability.startNotifier()
        } catch {
            print("Notifier is faild to start.")
        }
    }

    @objc func networkStatusChanged(_ notification: Notification) {
        //FIXME: - setup networkStatusChanged
    }

    static func stopNotifier() {
        do {
            try (NetworkManager.sharedInstance.reachability).startNotifier()
        } catch {
            print("Error stopping notifier")
        }
    }
    
    static func isReachable(completed: @escaping (NetworkManager) -> ()) {
        if NetworkManager.sharedInstance.reachability.connection != .none {
            completed(NetworkManager.sharedInstance)
        }
    }

    static func isUnreachable(completed: @escaping (NetworkManager) -> ()) {
        if NetworkManager.sharedInstance.reachability.connection == .none {
            completed(NetworkManager.sharedInstance)
        }
    }

    static func isReachableViaWWAN(completed: @escaping (NetworkManager) -> ()) {
        if NetworkManager.sharedInstance.reachability.connection == .cellular {
            completed(NetworkManager.sharedInstance)
        }
    }

    static func isReachableViaWiFi(completed: @escaping (NetworkManager) -> ()) {
        if NetworkManager.sharedInstance.reachability.connection == .wifi {
            completed(NetworkManager.sharedInstance)
        }
    }
}

