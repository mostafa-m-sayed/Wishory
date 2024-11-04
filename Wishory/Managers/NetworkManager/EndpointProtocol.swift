//
//  EndpointProtocol.swift
//  Wishory
//
//  Created by Mostafa Sayed on 03/11/2024.
//


import Foundation

protocol EndpointProtocol {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var header: [String: String]? { get }
    var queryParams: [String: Any]? { get }
    var multipartFormData: [(name: String, filename: String, data: Data)]? { get }
}

extension EndpointProtocol {
    
    func makeUrlRequest() throws -> URLRequest {
        guard let url = URL(string: baseURL)?.appending(path: path) else { throw NetworkManager.NetworkError.invalidURL
        }
        
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        //Add queryParams
        if let queryParams = queryParams {
            if method == .GET {
                let queryItems = queryParams.map { item in
                    return URLQueryItem(name: item.key, value: String(describing: item.value))
                }
                if var components = URLComponents(url: url, resolvingAgainstBaseURL: false) {
                    components.queryItems = queryItems
                    request.url = components.url
                }
                
            } else {
                // For other methods, add query parameters to the request body
                do {
                    let data = try JSONSerialization.data(withJSONObject: queryParams)
                    request.httpBody = data
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        
        //Add header
        if let header = header {
            for (key, value) in header {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        //Add multipart form data
        if let multipartFormData = multipartFormData {
            let boundary = "Boundary-\(UUID().uuidString)"
            request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
            
            for formData in multipartFormData {
                request.httpBody?.append("--\(boundary)\r\n".data(using: .utf8)!)
                request.httpBody?.append("Content-Disposition: form-data; name=\"\(formData.name)\"; filename=\"\(formData.filename)\"\r\n".data(using: .utf8)!)
                request.httpBody?.append("Content-Type: application/octet-stream\r\n\r\n".data(using: .utf8)!)
                request.httpBody?.append(formData.data)
                request.httpBody?.append("\r\n".data(using: .utf8)!)
            }
        }
        
        return request
    }
    
    var multipartFormData: [(name: String, filename: String, data: Data)]? {
        nil
    }

    var header: [String: String]? {
        return ["accept": "application/json",
                "content-type":"application/json",
                "Accept-Language": "en",
                "Authorization": UsersManager.shared.token ?? ""]

    }
}
