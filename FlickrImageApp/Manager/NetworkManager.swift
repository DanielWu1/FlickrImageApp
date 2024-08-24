//
//  NetworkManager.swift
//  FlickrImageApp
//
//  Created by Daniel li on 8/24/24.
//

import Foundation

/*
 *  NetworkManager
 *
 *  Discussion:
 *      NetworkManager for request is a singleton
 *
 */

final class NetworkManager: NSObject {
    
    static let shared: NetworkManager = {
        let instance = NetworkManager()
        return instance
    }()
    
    private override init() {
        super.init()
    }
    
    enum HTTPMethod: String {
        case GET
        case POST
        case PUT
        case DELETE
    }
    
    enum NetworkError: Error {
        case invalidURL
        case noData
        case invalidResponse
    }
    
    func request(urlString: String, method: HTTPMethod, body: Data?) async throws -> Data {
        

        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }
        

        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        if let body = body {
            request.httpBody = body
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        request.timeoutInterval = 20.0
        
        
        let (data, response) = try await URLSession.shared.data(for: request)
                
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        return data
        
            
            
        
    }
}

