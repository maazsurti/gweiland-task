////
////  ExtensionURLSession.swift
////  Reflex
////
////  Created by RCD on 09/11/2022.
////
//
//import Foundation
//
//enum CallMethod: String {
//    
//    case get = "GET"
//    case post = "POST"
//}
//
//extension URLSession {
//    
//    enum CustomError: Error {
//        
//        case invalidUrl
//        case invalidData
//    }
//    
//    func request<T: Codable> (
//        
//        url: URL?,
//        expecting: T.Type,
//        params: Params? = nil,
//        method: CallMethod = .get,
//        completion: @escaping (Result<T, Error>) -> Void) {
//            
//            guard let url = url else {
//                completion(.failure(CustomError.invalidUrl))
//                return
//            }
//            
//            var urlRequest = URLRequest(url: url)
//            
//            if let params {
//                
//                urlRequest.httpBody = params.percentEncoded()
//            }
//            
//            urlRequest.httpMethod = method.rawValue
//            
//            urlRequest.setValue(Constants.authToken, forHTTPHeaderField: "Token")
//            
//            let task = dataTask(with: urlRequest) { data, _, error in
//                
//                guard let data = data else {
//                    
//                    if let error = error {
//                        completion(.failure(error))
//                    } else {
//                        completion(.failure(CustomError.invalidData))
//                    }
//                    
//                    return
//                }
//                
//                do {
//                    
//                    let result = try JSONDecoder().decode(expecting, from: data)
//                    completion(.success(result))
//                    
//                } catch {
//                    
//                    completion(.failure(error))
//                    
//                }
//            }
//            
//            task.resume()
//        }
//    
//    func loginUser(with parameters: Parameters, completion: @escaping UserInfo)  {
//        
//        var request = URLRequest(url: Constants.loginUser!)
//        request.setValue("application/json", forHTTPHeaderField: "Accept")
//        request.setValue(Constants.authToken, forHTTPHeaderField: "Token")
//        request.httpMethod = "POST"
//        
//        let parameters: [String: Any] = [
//            
//            "email": parameters["email"] as? String ?? "email",
//            "password": parameters["password"] as? String ?? "password"
//        ]
//        
//        request.httpBody = parameters.percentEncoded()
//        
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            
//            guard let data = data,error == nil else {                                                               // check for fundamental networking error
//                print("error", error ?? URLError(.badServerResponse))
//                return
//            }
//            
//            
//            do {
//                
//                if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
//                    
//                    let message = jsonResponse["message"] as Any
//                    let messageAr = jsonResponse["message_ar"] as Any
//                    let staffID = jsonResponse["id"] as Any
//                    let success = jsonResponse["success"] as Any
//                    
//                    completion((success, message, staffID, messageAr))
//                    
//                    print(jsonResponse["message"] as? String ?? "DEBUG: jsonResponse")
//                    // handle json response
//                } else {
//                    print("DEBUG: data maybe corrupted or in wrong format")
//                    throw URLError(.badServerResponse)
//                }
//                
//            } catch {
//                
//                print(error) // parsing error
//                
//                if let responseString = String(data: data, encoding: .utf8) {
//                    
//                    print("responseString = \(responseString)")
//                    
//                } else {
//                    
//                    print("DEBUG: unable to parse response as string")
//                    
//                }
//            }
//        }
//        
//        task.resume()
//        
//    }
//}
