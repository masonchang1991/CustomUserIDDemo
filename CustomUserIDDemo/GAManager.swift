//
//  GAManager.swift
//  CustomUserIDDemo
//
//  Created by Mason on 2018/6/11.
//  Copyright © 2018年 Mason. All rights reserved.
//

import Foundation

class GAManager {
    
    enum CustomType: String {
        case a = "Apple"
        case b = "Banana"
    }
    
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
    
    static func createCustomScreenEventWith(_ screenName: String) {
        let tracker = GAI.sharedInstance().tracker(withTrackingId: AppDelegate.trackId)
        tracker?.set(kGAIScreenName, value: screenName)
        guard let builder = GAIDictionaryBuilder.createScreenView() else { return }
        //MARK: Custom Dimension
        let dimensionValue = GAManager.CustomType.b.rawValue
        tracker?.send(builder.set(dimensionValue, forKey: GAIFields.customDimension(for: 1)).build() as [NSObject: AnyObject])
    }
    
    static func createCustomEventWith(category: String, action: String, label: String, value: NSNumber) {
        guard let event = GAIDictionaryBuilder.createEvent(withCategory: category, action: action, label: label, value: value) else { return }
        let tracker = GAI.sharedInstance().tracker(withTrackingId: AppDelegate.trackId)
        //MARK: Custom Dimension
        let dimensionValue = GAManager.CustomType.b.rawValue
        tracker?.send(event.set(dimensionValue, forKey: GAIFields.customDimension(for: 1)).build() as [NSObject: AnyObject])
    }
}
