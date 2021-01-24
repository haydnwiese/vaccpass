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
struct Booking {
    let date: NSDate;
    let location: String;
}
class UserData: NSObject, NSCoding {
    static let sharedInstance = UserData();
    var userName: String;
    var email: String;
    var age: Int;
    var userID: String;
    var healthCardNum: String;
    var address: String;
    var vaccinationState: String;
    var bookings: Array<Booking>;
    
    override init() {
        userName = "";
        email = "";
        age = 0;
        userID = "";
        healthCardNum = "";
        address = "";
        vaccinationState = "";
        bookings = [];
    }
    func encode(with coder: NSCoder) {
        coder.encode(userName, forKey: PropertyKey.userName);
        coder.encode(email, forKey: PropertyKey.email);
        coder.encode(age, forKey: PropertyKey.age);
        coder.encode(userID, forKey: PropertyKey.userID);
        coder.encode(healthCardNum, forKey: PropertyKey.healthCardNum);
        coder.encode(vaccinationState, forKey: PropertyKey.vaccinationState);
        coder.encode(bookings, forKey: PropertyKey.bookings);
    }
    
    required init?(coder: NSCoder) {
        userName = coder.decodeObject(forKey: PropertyKey.userName) as! String;
        email = coder.decodeObject(forKey: PropertyKey.email) as! String;
        age = coder.decodeInteger(forKey: PropertyKey.age);
        userID = coder.decodeObject(forKey: PropertyKey.userID) as! String;
        healthCardNum = coder.decodeObject(forKey: PropertyKey.healthCardNum) as! String;
        address = coder.decodeObject(forKey: PropertyKey.address) as! String;
        vaccinationState = coder.decodeObject(forKey: PropertyKey.vaccinationState) as! String;
        bookings = coder.decodeObject(forKey: PropertyKey.bookings) as! Array<Booking>;
    }
    
    
}
