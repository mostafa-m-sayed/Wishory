//
//  NetworkManager.swift
//  Wishory
//
//  Created by Mostafa Sayed on 03/11/2024.
//


import Foundation

protocol NetworkManagerProtocol {
    func sendRequest<T: Decodable>(_ endpoint: EndpointProtocol, responseType: T.Type) async throws -> T
}

actor NetworkManager: NetworkManagerProtocol {
    static let shared = NetworkManager()
    
    private init() {}
    
    //Error enums
     enum NetworkError: Error {
        case invalidURL
        case requestFailed
        case invalidResponse
        case decodingError(String)
        case serverError(String)
    }
    
    enum Environment {
        case development
        case production
    }
    
    static var environment: Environment = .development
    
    static var baseURL: String {
        switch environment {
        case .development:
            return "'https://fakestoreapi.com"
        case .production:
            return "'https://fakestoreapi.com"
        }
    }

    func sendRequest<T: Decodable>(_ endpoint: EndpointProtocol, responseType: T.Type) async throws -> T {

        // Create an HTTP request using the provided endpoint.
        let request = try endpoint.makeUrlRequest()
        print("URL:", request.url?.absoluteString ?? "")
        if let httpBody = request.httpBody, let bodyString = String(data: httpBody, encoding: .utf8) {
            print("HTTP Body:", bodyString)
        }

        do {
            // Perform the network request and await the response.
            let (data, response) = try await URLSession.shared.data(for: request)

            if let dataString = String(data: data, encoding: .utf8) {
                print("data:", dataString)
            }
            // Check if the response status code is in the 200-299 range.
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                if let message = try extractMessageFromData(data: data) {
                    throw NetworkError.serverError(message)
                } else {
                    throw NetworkError.invalidResponse
                }
            }
            do {
                // Deserialization
                let response = try JSONDecoder().decode(T.self, from: data)
                return response
            } catch {
                throw NetworkError.decodingError("Unable to decode response")
            }
            
        } catch let error as NetworkError {
            // If it's already a NetworkError, rethrow it
            throw error
        }  catch {
            throw NetworkError.requestFailed
        }
    }

    private func extractMessageFromData(data: Data) throws -> String? {
        if let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
            return jsonDictionary["message"] as? String
        }
        return nil
    }
}
