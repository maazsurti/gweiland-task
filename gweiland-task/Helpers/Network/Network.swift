//
//  Network.swift
//  DiamondHouse
//
//  Created by RCD on 16/01/2023.
//

import Foundation

public typealias Params = [String: Any]

enum ApiError: Error {
    case requestFailed(description: String)
    case invalidData
    case invalidURL
    case responseUnsuccessful(description: String)
    case jsonConversionFailure(description: String)
    case jsonParsingFailure
    case failedSerialization
    case noInternet
    
    var customDescription: String {
        switch self {
        case let .requestFailed(description): return "Request Failed: \(description)"
        case .invalidData: return "Invalid Data"
        case .invalidURL: return "Invalid URL"
        case let .responseUnsuccessful(description): return "Unsuccessful: \(description)"
        case let .jsonConversionFailure(description): return "JSON Conversion Failure: \(description)"
        case .jsonParsingFailure: return "JSON Parsing Failure"
        case .failedSerialization: return "Serialization failed."
        case .noInternet: return "No internet connection"
        }
    }
}

enum Method: String {
    
    case get = "GET"
    case post = "POST"
}

protocol GenericApi {
    var session: URLSession { get }
    func request<T: Codable>(type: T.Type, params: Params?, method: Method, with URL: URL?, showResponse: Bool) async throws -> T
}

extension GenericApi {
    
    func request<T: Codable>(type: T.Type, params: Params? = nil, method: Method = .get, with URL: URL?, showResponse: Bool = false) async throws -> T {
        
        guard let URL = URL else {
            throw ApiError.invalidURL
        }
        
        var request = URLRequest(url: URL)
        
        let apiKey = "a3da8db5-0e66-4433-a3df-d9ed0a1be91e"
        
        request.setValue(apiKey, forHTTPHeaderField: "X-CMC_PRO_API_KEY")

        request.setValue(isArabic ? "ar" : "en", forHTTPHeaderField: "Accept-Language")
        
        request.setValue("ios", forHTTPHeaderField: "Platform")
        
        if let params {
            
            request.httpBody = params.percentEncoded()
        }
        
        request.httpMethod = method.rawValue
        
        let (data, response) = try await session.data(for: request)
        
        if showResponse {
            
            if let responseString = String(data: data, encoding: .utf8) {
                print("Response: \(responseString)")
            }
        }
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw ApiError.requestFailed(description: "Invalid response")
        }
        guard httpResponse.statusCode == 200 else {
            throw ApiError.responseUnsuccessful(description: "Status code: \(httpResponse.statusCode)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(type, from: data)
        } catch let error as DecodingError{
            switch error {
            case .typeMismatch(let key, let value):
                print("error \(key), value \(value) and ERROR: \(error.localizedDescription)")
            case .valueNotFound(let key, let value):
                print("error \(key), value \(value) and ERROR: \(error.localizedDescription)")
            case .keyNotFound(let key, let value):
                print("error \(key), value \(value) and ERROR: \(error.localizedDescription)")
            case .dataCorrupted(let key):
                print("error \(key), and ERROR: \(error.localizedDescription)")
            default:
                print("ERROR: \(error.localizedDescription)")
            }
            throw ApiError.jsonConversionFailure(description:error.localizedDescription)
        }
    }
}

final class Network: GenericApi {
    
    var session: URLSession

    init(configuration: URLSessionConfiguration) {
     self.session = URLSession(configuration: configuration)
    }

    convenience init() {
     self.init(configuration: .default)
    }
}

extension Dictionary {
    func percentEncoded() -> Data? {
        map { key, value in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            return escapedKey + "=" + escapedValue
        }
        .joined(separator: "&")
        .data(using: .utf8)
    }
}


