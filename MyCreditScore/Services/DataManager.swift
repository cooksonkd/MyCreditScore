//
//  DataManager.swift
//  MyCreditScore
//
//  Created by User on 2021/06/17.
//

import UIKit

protocol DataManagerDelegate: UIViewController {
    func updateViewController(creditReportInfo: CreditReportInfo?)
}

/// A singleton class responsible for managing the data return from the api.
class DataManager {
    static let shared = DataManager()
    private let urlString = "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit/values"
    var delegate: DataManagerDelegate?
    
    private init() {
        fetchCreditReportFromApi { [weak self] creditReportInfo, error in
            if let strongSelf = self {
                if let creditReportInfo = creditReportInfo {
                    DispatchQueue.main.async {
                        strongSelf.delegate?.updateViewController(creditReportInfo: creditReportInfo)
                    }
                }
            }
        }
    }
    
    /// This method sends a request off to the api.
    /// - Parameter requestCompletion: A function that has a parameter of type CreditReportInfo?
    /// - Returns: Void
    private func fetchCreditReportFromApi(requestCompletion: @escaping (CreditReportInfo?, Error?)->()) {
        if let url = URL(string: urlString) {
            NetworkRequest.fetchRequest(url: url) { [weak self] data, resonse, error in
                if let strongSelf = self {
                    if let data = data {
                        requestCompletion(strongSelf.decodeJSONFromAPI(data: data, error: nil), nil)
                    } else if let error = error {
                        requestCompletion(nil, error)
                    }
                }
            }
        }
    }
    
    /// Takes in data in the form of JSON and parses it.
    /// - Parameters:
    ///   - data: Data received from the api.
    ///   - error: Error received from the api.
    /// - Returns: An object of type CreditReportInfo?
    private func decodeJSONFromAPI(data: Data?, error: Error?) -> CreditReportInfo? {
        if let data = data {
            if let apiResponse = try? JSONDecoder().decode(ApiResponse.self, from: data) {
                if let creditReportInfo = apiResponse.creditReportInfo {
                    return creditReportInfo
                } else {
                    return nil
                }
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
}
