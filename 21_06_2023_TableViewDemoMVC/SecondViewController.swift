//
//  SecondViewController.swift
//  21_06_2023_TableViewDemoMVC
//
//  Created by Vishal Jagtap on 25/07/23.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var empFirstNameTextField: UITextField!
    @IBOutlet weak var empLastNameTextField: UITextField!
    @IBOutlet weak var empIdTextField: UITextField!
    
    var empFirstName : String = ""
    var empLastName : String = ""
    var empId : String = ""
  
    var empDelegate : BackDataPassing?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        navigationItem.hidesBackButton = true
    }
    
    
    @IBAction func btnBack(_ sender: UIButton) {
        
        guard let empDelegateNew = empDelegate else { return }
        
        empFirstName = empFirstNameTextField.text!
        empLastName = empLastNameTextField.text!
        empId = empIdTextField.text!
        
        let empObject = Employee(
            empFirstName: empFirstName,
            empLastName: empLastName,
            empId: empId.codingKey.intValue ?? 12)
        
        empDelegateNew.employeeDataToBePassed(employee: empObject)
        
        navigationController?.popViewController(animated: true)
    }
    

}
