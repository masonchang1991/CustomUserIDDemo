//
//  AppDelegate.swift
//  CustomUserIDDemo
//
//  Created by Mason on 2018/6/11.
//  Copyright © 2018年 Mason. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    static let trackId = "UA-120629679-1"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        guard let gai = GAI.sharedInstance() else {
            assert(false, "Google Analytics not configured correctly")
        }
        gai.tracker(withTrackingId: AppDelegate.trackId)
        gai.trackUncaughtExceptions = true
        gai.logger.logLevel = .verbose;
        return true
    }
}

