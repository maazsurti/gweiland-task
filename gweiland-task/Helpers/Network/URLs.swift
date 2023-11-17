//
//  URLs.swift
//  Nounou
//
//  Created by RCD on 24/05/2023.
//

import Foundation

let baseURL = "https://pro-api.coinmarketcap.com/"

let cryptoCurrencyListingsURL = baseURL + "v1/cryptocurrency/listings/latest?limit=20"

func metadataURL(for id: String) -> String{
    return baseURL + "v2/cryptocurrency/info?id=\(id)"
}
