//
//  APIManager.swift
//  Reflex
//
//  Created by Maaz on 22/09/22.
//

import Foundation
import UIKit
import WebKit

let placeholderImageURL = URL(string: "https://via.placeholder.com/300/")!

let placeholderImageURLString = "https://via.placeholder.com/300/"

func getZoomDisableScript() -> WKUserScript {
    
    let source: String = "var meta = document.createElement('meta');" +
    "meta.name = 'viewport';" +
    "meta.content = 'width=device-width, initial-scale=1.0, maximum- scale=1.0, user-scalable=no';" +
    "var head = document.getElementsByTagName('head')[0];" + "head.appendChild(meta);"
    return WKUserScript(source: source, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
}

