//
//  NetworkRequest.swift
//  MyCreditScore
//
//  Created by User on 2021/06/16.
//

import Foundation

class NetworkRequest {
    /// Sends a GET request to the specified URL.
    ///
    /// - Parameters:
    ///   - url: URL of API.
    ///   - completionHandler: A closure that handles the result of the network request.
    class func fetchRequest(url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                completionHandler(data, response, nil)
            } else if let error = error {
                completionHandler(nil, response, error)
            }
        }
        task.resume()
    }
}
