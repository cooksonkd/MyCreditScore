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

class DataManager {
    static let shared = DataManager()
    private let urlString = "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit/values"
    var delegate: DataManagerDelegate?
    
    private init() {
        fetchCreditReportFromApi { [weak self] creditReportInfo in
            if let strongSelf = self {
                if let creditReportInfo = creditReportInfo {
                    DispatchQueue.main.async {
                        strongSelf.delegate?.updateViewController(creditReportInfo: creditReportInfo)
                    }
                }
            }
        }
    }
    
    private func fetchCreditReportFromApi(requestCompletion: @escaping (CreditReportInfo?)->()) {
        if let url = URL(string: urlString) {
            NetworkRequest.fetchRequest(url: url) { [weak self] data, error in
                if let strongSelf = self {
                    if let data = data {
                        requestCompletion(strongSelf.decodeJSONFromAPI(data: data, error: nil))
                    }
                }
            }
        }
    }
    
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
