//
//  Font.swift
//  Nounou
//
//  Created by RCD on 24/05/2023.
//

import Foundation
import UIKit

extension UIFont {

    public enum CustomType: String, CaseIterable {
        
        case thin = "-Thin"
        case extraLight = "-ExtraLight"
        case light = "-Light"
        case regular = "-Regular"
        case medium = "-Medium"
        case semiBold = "-SemiBold"
        case bold = "-Bold"
        case extraBold = "-ExtraBold"
        case black = "-Black"
    }
    
    public static func CustomFont(_ type: CustomType = .regular, size: CGFloat = UIFont.systemFontSize) -> UIFont {
        
        let englishFontName = "Inter\(type.rawValue)"
        
//        for font in CustomType.allCases {
//            debugPrint("Font name is Inter\(font.rawValue)")
//        }
//        
//        debugPrint("Selected font is \(englishFontName)")
        
//        guard let englishFont = UIFont(name: englishFontName, size: size),
//              let arabicFont = UIFont(name: "Almarai\(type.rawValue)", size: size + 1.0) else {
//            return .systemFont(ofSize: size)
//        }
//        
//        let englishFontWithArabicFallback = englishFont.fontDescriptor.addingAttributes(
//            [.cascadeList: [arabicFont.fontDescriptor]]
//        )
        
        //return UIFont(descriptor: englishFontWithArabicFallback, size: size)
        
        return UIFont(name: englishFontName, size: size) ?? UIFont()
    }
    
    public enum FontSize: CGFloat {
        
        case footnote
        
        public var rawValue: CGFloat {
            
            switch self {
            case .footnote: return UIScreen.main.bounds.size.width * 0.03
                
            }
        }
    }
}
