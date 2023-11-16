//
//  PersistentData.swift
//  Nounou
//
//  Created by RCD on 24/05/2023.
//

import Foundation
import UIKit

extension UserDefaults {
    
    static let UserDefault = UserDefaults.standard    
}

 enum Keys {
    
    static let isFirstLaunch = "isFirstLaunch"
    
    static let isUserLoggedIn = "isUserLoggedIn"
    
    static let username = "username"
    
    static let userPhoneNumber = "userPhoneNumber"
    
    static let userEmail = "userEmail"
    
    static let isArabic = "isArabic"
    
    static let userID = "userID"
     
    static let itemsInCart = "itemsInCart"
     
    static let hasLaunchedBefore = "HasLaunchedBefore"
     
    static let authToken = "authToken"
     
    static let userAddress = "userAddress"
}

class UserData {
    
    static var isUserLoggedIn: Bool {
        
        get {  return UserDefaults.standard.bool(forKey: Keys.isUserLoggedIn) }
        set {  UserDefaults.standard.set(newValue, forKey: Keys.isUserLoggedIn) }
    }

    static var username: String {
        
        get {  return UserDefaults.standard.string(forKey: Keys.username) ?? "" }
        set { UserDefaults.standard.set(newValue, forKey: Keys.username) }
    }
    
    static var authToken: String {
        
        get {  return UserDefaults.standard.string(forKey: Keys.authToken) ?? "" }
        set { UserDefaults.standard.set(newValue, forKey: Keys.authToken) }
    }

    static var userPhoneNumber: String {
        
        get { return UserDefaults.standard.string(forKey: Keys.userPhoneNumber) ?? "" }
        set { UserDefaults.standard.set(newValue, forKey: Keys.userPhoneNumber) }
    }

    static var userID: Int {
        
        get { return UserDefaults.standard.integer(forKey: Keys.userID)}
        set { UserDefaults.standard.set(newValue, forKey: Keys.userID) }
    }

    static var userEmail: String {
        
        get { return UserDefaults.standard.string(forKey: Keys.userEmail) ?? ""}
        set { UserDefaults.standard.set(newValue, forKey: Keys.userEmail) }
    }
    
    static var itemsInCart: Int {
        
        get { return UserDefaults.standard.integer(forKey: Keys.itemsInCart)}
        set { UserDefaults.standard.set(newValue, forKey: Keys.itemsInCart) }
    }

    
    static var isFirstLaunch: Bool {
        get {
            let hasLaunchedBefore = UserDefaults.standard.bool(forKey: Keys.hasLaunchedBefore)
            if !hasLaunchedBefore {
                UserDefaults.standard.set(true, forKey: Keys.hasLaunchedBefore)
            }
            return !hasLaunchedBefore
        }
    }

}

var isArabic: Bool {
    
    get { return UserDefaults.standard.bool(forKey: Keys.isArabic) }
    set { UserDefaults.standard.set(newValue, forKey: Keys.isArabic) }
}


///For checking if the application is being launched for the first time
func isFirstLaunch() -> Bool {
    
    if !UserDefaults.standard.bool(forKey: Keys.isFirstLaunch) {
        UserDefaults.standard.set(true, forKey: Keys.isFirstLaunch)
        return true
    }
    
    return false
}
