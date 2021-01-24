//
//  BookingTableViewCell.swift
//  VaccPass
//
//  Created by Jonathan Ho on 2021-01-23.
//  Copyright © 2021 Jonathan Ho. All rights reserved.
//

import UIKit

class BookingTableViewCell: UITableViewCell {

    @IBOutlet weak var checkImage: UIImageView!
    
    @IBOutlet weak var dataLabel: UILabel!
    
    var dataField: String;
    var chosen: Bool;
    var dataValue: String;
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.dataField = "";
        self.chosen = false;
        self.dataValue = "";
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        self.chosen = false;
        checkImage.isHidden = !self.chosen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.chosen = false;
        checkImage.isHidden = !self.chosen
        // Initialization code
    }
    func setContent(field:String, value:String) {
        self.dataField = field;
        self.dataValue = value;
    }

    func unselect() {
        self.chosen = false;
        checkImage.isHidden = !self.chosen
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.chosen = !self.chosen;
        checkImage.isHidden = !self.chosen;
        

        // Configure the view for the selected state
    }

}
