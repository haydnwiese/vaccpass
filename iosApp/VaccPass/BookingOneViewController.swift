//
//  BookingOneViewController.swift
//  VaccPass
//
//  Created by Jonathan Ho on 2021-01-23.
//  Copyright © 2021 Jonathan Ho. All rights reserved.
//

import UIKit

class BookingOneTableViewController:  UITableViewController {
    
    let locationsList = NSArray(array: ["Sick Kids Hospital", "Ottawa General Hospital", "Montfort Hospital"]);
    var dateTimeList: Array<Any>;
    
    init() {
        let timeDate1 = NSDateComponents.init()
        timeDate1.day = 1;
        timeDate1.month = 2;
        timeDate1.year = 2021;
        timeDate1.hour = 13;
        timeDate1.minute = 0;
        let timeDate2 = NSDateComponents.init()
        timeDate2.day = 1;
        timeDate2.month = 2;
        timeDate2.year = 2021;
        timeDate2.hour = 14;
        timeDate2.minute = 0;
        let timeDate3 = NSDateComponents.init()
        timeDate3.day = 1;
        timeDate3.month = 2;
        timeDate3.year = 2021;
        timeDate3.hour = 15;
        timeDate3.minute = 0;
        self.dateTimeList = NSArray.init(array: [timeDate1, timeDate2, timeDate3]) as! Array<NSDateComponents>;
        super.init(nibName: nil, bundle: nil)
        tableView.delegate = self;
        tableView.dataSource = self;
        //navigationItem.title = "Bookings"

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        

        // Do any additional setup after loading the view.
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1;
        } else {
            return 3
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0) {
            let cellToReturn = tableView.dequeueReusableCell(withIdentifier: "topTableCell") as! TopTableViewCell;
            cellToReturn.setContent(prompt: "Select a location, date and time for your first booking", bookingCount:"Booking 1 of 2:");
            return cellToReturn;
        } else if (indexPath.section == 1) {
            let cellToReturn = tableView.dequeueReusableCell(withIdentifier: "optionTableCell") as! BookingTableViewCell;
            cellToReturn.setContent(field: "location", value: self.locationsList[indexPath.row] as! String) ;
            return cellToReturn;
        } else if (indexPath.section == 2) {
            let cellToReturn = tableView.dequeueReusableCell(withIdentifier: "optionTableCell") as! BookingTableViewCell;
            let dateForIndex = NSCalendar.current.date(from: self.dateTimeList[indexPath.row] as! DateComponents)
            let dateFormatter = DateFormatter();
            dateFormatter.dateFormat = "MMM-dd-yyy";
            
            cellToReturn.setContent(field: "date", value: dateFormatter.string(from: dateForIndex!));
            return cellToReturn;
        } else {
            let cellToReturn = tableView.dequeueReusableCell(withIdentifier: "optionTableCell") as! BookingTableViewCell;
            let dateForIndex = NSCalendar.current.date(from: self.dateTimeList[indexPath.row] as! DateComponents)
            let dateFormatter = DateFormatter();
            dateFormatter.dateFormat = "HH:mm";
            
            cellToReturn.setContent(field: "time", value: dateFormatter.string(from: dateForIndex!));
            return cellToReturn;
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

}
