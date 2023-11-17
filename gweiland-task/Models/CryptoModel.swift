//
//  CryptoModel.swift
//  gweiland-task
//
//  Created by Maaz on 17/11/23.
//

import Foundation

// MARK: - CryptoModel
struct CryptoModel: Codable {
    let status: Status?
    let data: [Cryptocurrency]?
}

// MARK: - Cryptocurrency
struct Cryptocurrency: Codable {
    let id: Int?
    let name, symbol: String?
    let quote: Quote?

    enum CodingKeys: String, CodingKey {
        case id, name, symbol
        case quote
    }
}



// MARK: - Platform
struct Platform: Codable {
    let id: Int?
    let name, symbol, slug, tokenAddress: String?

    enum CodingKeys: String, CodingKey {
        case id, name, symbol, slug
        case tokenAddress = "token_address"
    }
}

// MARK: - Quote
struct Quote: Codable {
    let usd: Usd?

    enum CodingKeys: String, CodingKey {
        case usd = "USD"
    }
}

// MARK: - Usd
struct Usd: Codable {
    let price, volume24H, volumeChange24H, percentChange1H: Double?
    let percentChange24H, percentChange7D, percentChange30D, percentChange60D: Double?
    let percentChange90D, marketCap, marketCapDominance, fullyDilutedMarketCap: Double?
    let tvl: Double?

    enum CodingKeys: String, CodingKey {
        case price
        case volume24H = "volume_24h"
        case volumeChange24H = "volume_change_24h"
        case percentChange1H = "percent_change_1h"
        case percentChange24H = "percent_change_24h"
        case percentChange7D = "percent_change_7d"
        case percentChange30D = "percent_change_30d"
        case percentChange60D = "percent_change_60d"
        case percentChange90D = "percent_change_90d"
        case marketCap = "market_cap"
        case marketCapDominance = "market_cap_dominance"
        case fullyDilutedMarketCap = "fully_diluted_market_cap"
        case tvl
    }
}

// MARK: - Status
struct Status: Codable {
    let timestamp: String?
    let errorCode: Int?
    let errorMessage: String?
    let elapsed, creditCount: Int?
    let notice: String?
    let totalCount: Int?

    enum CodingKeys: String, CodingKey {
        case timestamp
        case errorCode = "error_code"
        case errorMessage = "error_message"
        case elapsed
        case creditCount = "credit_count"
        case notice
        case totalCount = "total_count"
    }
}
