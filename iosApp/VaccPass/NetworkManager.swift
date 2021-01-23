//
//  NetworkManager.swift
//  VaccPass
//
//  Created by Jonathan Ho on 2021-01-23.
//  Copyright © 2021 Jonathan Ho. All rights reserved.
//

import Foundation
import Alamofire


protocol Endpoint {
    var scheme: String {get}
    var baseUrl: String {get}
    var path: String {get}
    var parameters: [URLQueryItem] {get}
    var method: String {get}
}
struct registerUser: Encodable {
    let email: String
    let userName: String
    let healthCardNum: String
    let address: String
    let age: Int
}


class NetworkManager {
    static let sharedInstance = NetworkManager();
    let authToken = "";
    init() {
    }
    
    func registerUser(registrationData: registerUser) {
        guard let url = URL(string: "url") else {return};
        AF.request(url, method: .post, parameters: registrationData, encoder: JSONParameterEncoder.default).response{
            response in debugPrint(response)
        }
    }
    
}
