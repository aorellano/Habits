//
//  APIRequest.swift
//  Habits
//
//  Created by Alexis Orellano on 6/7/21.
//

import UIKit

protocol APIRequest {
    //represents the type of object returned by a request.
    associatedtype Response
    
    //builds a URL request
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
    var request: URLRequest { get }
    var postData: Data? { get }
}

extension APIRequest {
    var host: String { "localhost" }
    var port: Int { 8080 }
}

extension APIRequest {
    var queryItems: [URLQueryItem]? { nil }
    var postData: Data? { nil }
}

extension APIRequest {
    var request: URLRequest {
        var components = URLComponents()
        
        components.scheme = "http"
        components.host = host
        components.port = port
        components.path = path
        components.queryItems = queryItems
        
        var request = URLRequest(url: components.url!)
        
        if let data = postData {
            request.httpBody = data
            request.addValue("applicatio/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
        }
        
        return request
    }
}
