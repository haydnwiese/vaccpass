//
//  UserData.swift
//  VaccPass
//
//  Created by Jonathan Ho on 2021-01-23.
//  Copyright © 2021 Jonathan Ho. All rights reserved.
//

import Foundation
struct PropertyKey {
    static let userName = "userName";
    static let email = "emial";
    static let age = "age";
    static let userID = "userID";
    static let healthCardNum = "healthCardNum";
    static let address = "address";
    static let vaccinationState = "vaccinationState";
    static let bookings = "bookings";
}
let singleUser = UserData()
class UserData: NSObject, NSCoding {
    var userName: String;
    var email: String;
    var age: Int;
    var userID: String;
    var healthCardNum: String;
    var address: String;
    var vaccinationState: String;
    var bookings: Array<Any>;
    
    override init() {
        super.init();
        self.userName = "";
        self.email = "";
        self.age = 0;
        self.userID = "";
        self.healthCardNum = "";
        self.address = "";
        self.vaccinationState = "";
        self.bookings = [];
    }
    func encode(with coder: NSCoder) {
        coder.encode(self.userName, forKey: PropertyKey.userName);
        coder.encode(self.email, forKey: PropertyKey.email);
        coder.encode(self.age, forKey: PropertyKey.age);
        coder.encode(self.userID, forKey: PropertyKey.userID);
        coder.encode(self.healthCardNum, forKey: PropertyKey.healthCardNum);
        coder.encode(self.vaccinationState, forKey: PropertyKey.vaccinationState);
        coder.encode(self.bookings, forKey: PropertyKey.bookings);
    }
    
    required init?(coder: NSCoder) {
    }
    
    
}
