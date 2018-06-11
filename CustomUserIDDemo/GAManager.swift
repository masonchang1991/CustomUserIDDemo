//
//  GAManager.swift
//  CustomUserIDDemo
//
//  Created by Mason on 2018/6/11.
//  Copyright © 2018年 Mason. All rights reserved.
//

import Foundation

class GAManager {
    
    static func createNormalScreenEventWith(_ screenName: String) {
        let tracker = GAI.sharedInstance().tracker(withTrackingId: AppDelegate.trackId)
        tracker?.set(kGAIScreenName, value: screenName)
        guard let builder = GAIDictionaryBuilder.createScreenView() else { return }
        tracker?.send(builder.build() as [NSObject: AnyObject])
    }
    
    static func createNormalEventWith(category: String, action: String, label: String, value: NSNumber) {
        guard let event = GAIDictionaryBuilder.createEvent(withCategory: category, action: action, label: label, value: value) else { return }
        let tracker = GAI.sharedInstance().tracker(withTrackingId: AppDelegate.trackId)
        tracker?.send(event.build() as [NSObject: AnyObject])
    }
}
