//
//  Localization.swift
//  Nounou
//
//  Created by RCD on 24/05/2023.
//

import Foundation
import UIKit

enum Language: String {
    
    case ar
    case en
}

extension Bundle {
    
    var displayName: String? {
        return object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ?? object(forInfoDictionaryKey: kCFBundleNameKey as String) as? String
    }
    
    private static var bundle: Bundle?

    public static func localizedBundle() -> Bundle {
        
        if bundle == nil {
            var appLang = UserDefaults.standard.string(forKey: "app_lang") ?? "en"
            if Bundle.main.path(forResource: appLang, ofType: "lproj") == nil {
                appLang = "en"
            }
            let path = Bundle.main.path(forResource: appLang, ofType: "lproj")
            bundle = Bundle(path: path ?? "")
        }

        return bundle ?? Bundle()
    }

    static func setLanguage(lang: Language) {
        
        UserDefaults.standard.set(lang.rawValue, forKey: "app_lang")
        let path = Bundle.main.path(forResource: lang.rawValue, ofType: "lproj")
        bundle = Bundle(path: path!)
        
        if lang == .ar {
            
            isArabic = true
            
        } else {
            
            isArabic = false
        }
        
//        UserDefaults.standard.set([isArabic ? "ar" : "en" ], forKey: "AppleLanguages")
//        UserDefaults.standard.synchronize()
        
        reloadUI()
    }
    
    static func setCurrentlySelectedLanguage() {
        
        let language: Language = isArabic ? .ar : .en
        UserDefaults.standard.set(language.rawValue, forKey: "app_lang")
        let path = Bundle.main.path(forResource: language.rawValue, ofType: "lproj")
        Bundle.bundle = Bundle(path: path ?? "")
        reloadUI()
    }
}

extension String {
    
    func localized() -> String {
        
        return NSLocalizedString(self,
                                 tableName: "Localizable",
                                 bundle: Bundle.localizedBundle(),
                                 value: self,
                                 comment: self)
    }
    
}

func reloadUI() {
    
    if !isArabic {
        UIView.appearance().semanticContentAttribute = .forceLeftToRight
        UINavigationController().navigationBar.semanticContentAttribute = .forceLeftToRight
        if let keyWindow = UIApplication.shared.keyWindow {
            keyWindow.rootViewController?.view.semanticContentAttribute = .forceLeftToRight
            keyWindow.semanticContentAttribute = .forceLeftToRight
        }
    }
    else {
        UIView.appearance().semanticContentAttribute = .forceRightToLeft
        UINavigationController().navigationBar.semanticContentAttribute = .forceRightToLeft
        if let keyWindow = UIApplication.shared.keyWindow {
            keyWindow.rootViewController?.view.semanticContentAttribute = .forceRightToLeft
            keyWindow.semanticContentAttribute = .forceRightToLeft
        }
    }
}


