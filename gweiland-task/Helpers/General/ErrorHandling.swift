//
//  GlobalFunctions.swift
//  Nounou
//
//  Created by Maaz on 23/06/23.
//

import Foundation

class AlertMessages {
    
    static let unknownErrorMessage = "Something went wrong. Please try again later"
}

func printError(error: Error) {
    
    debugPrint("DEBUG: \((error as? ApiError)?.customDescription ?? "Unknown Error")")
}

func printError(with description: String) {
    
    debugPrint("DEBUG: \(description)")
}

func printError(with error: Error) {
    
    debugPrint("DEBUG: \((error as? ApiError)?.customDescription ?? "Unknown Error")")
}

func printNetworkError(){
    debugPrint("DEBUG: Network error occured")
}

