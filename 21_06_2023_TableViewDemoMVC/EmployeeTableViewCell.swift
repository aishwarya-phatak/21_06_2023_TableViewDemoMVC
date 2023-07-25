//
//  EmployeeTableViewCell.swift
//  21_06_2023_TableViewDemoMVC
//
//  Created by Vishal Jagtap on 25/07/23.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var empFirstNameLabel: UILabel!
    @IBOutlet weak var empLastNameLabel: UILabel!
    @IBOutlet weak var empIdLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
