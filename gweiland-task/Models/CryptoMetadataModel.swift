//
//  CryptoMetadataModel.swift
//  gweiland-task
//
//  Created by Maaz on 17/11/23.
//

import Foundation

// MARK: - CryptoMetadataModel
struct CryptoMetadataModel: Codable {
    let status: Status?
    let data: [String: Datum]?
}

// MARK: - Datum
struct Datum: Codable {
    let id: Int?
    let name, symbol: String?    
    let logo: String?

    enum CodingKeys: String, CodingKey {
        case id, name, symbol, logo

    }
}
