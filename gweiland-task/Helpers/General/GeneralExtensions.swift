//
//  GeneralExtensions.swift
//  Nounou
//
//  Created by Maaz on 05/07/23.
//

import Foundation

extension Double{
    func roundedTo3Digits()-> String{
        let nf = NumberFormatter()
        nf.maximumFractionDigits = 3
        nf.minimumFractionDigits = 3
        return nf.string(from: NSNumber(floatLiteral: self)) ?? ""
    }
}
