//
//  APICalls.swift
//  Nounou
//
//  Created by Maaz on 07/08/23.
//

import Foundation

class API {
    
    let network = Network()
    
    func getCryptocurrencies() async throws -> [Cryptocurrency]{
        
        guard let url = URL(string: cryptoCurrencyListingsURL) else {
            throw ApiError.invalidURL
        }
        
        do {
            
            let data = try await network.request(type: CryptoModel.self, with: url)
            
            return data.data ?? []
            
        } catch {
            
            throw error
        }
    }
    
    func getLogos(for model: [Cryptocurrency]) async throws -> [[String: String]] {
        let commaSeparatedIds = model.compactMap { $0.id }.map(String.init).joined(separator: ",")
        
        guard let url = URL(string: metadataURL(for: "\(commaSeparatedIds)")) else {
            throw ApiError.invalidURL
        }
        
        do {
            let data = try await network.request(type: CryptoMetadataModel.self, with: url)
            
            guard let extractedData = data.data else {
                print("Failed to extract logos.")
                // Handle the error or return from the function as needed
                throw ApiError.invalidData
            }

            let logoArray: [[String: String]] = extractedData.map { (key, datum) in
                return [key: datum.logo ?? ""]
            }
            
            return logoArray
            
        } catch {
            throw error
        }
    }

}
