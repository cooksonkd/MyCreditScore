//
//  DataManager.swift
//  MyCreditScore
//
//  Created by User on 2021/06/17.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    private init() {}
    
    func fetchCreditReportFromApi(completion: (CreditReportInfo?)->()) {
        
    }
}
