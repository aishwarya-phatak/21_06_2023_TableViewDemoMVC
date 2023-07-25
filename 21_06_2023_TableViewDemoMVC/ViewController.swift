//
//  ViewController.swift
//  21_06_2023_TableViewDemoMVC
//
//  Created by Vishal Jagtap on 25/07/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var employeeTableView: UITableView!
    
    //var employees = [Employee]()
    var employees : [Employee] = []
    var secondViewController : SecondViewController = SecondViewController()
    var employeeTableViewCell : EmployeeTableViewCell = EmployeeTableViewCell()
     
    override func viewDidLoad() {
        super.viewDidLoad()
        registerAnXIBWithemployeeTabelView()
        employeeTableView.dataSource = self
        employeeTableView.delegate = self
    }
    
    func registerAnXIBWithemployeeTabelView(){
        let uiNib = UINib(nibName: "EmployeeTableViewCell", bundle: nil)
        self.employeeTableView.register(uiNib, forCellReuseIdentifier: "EmployeeTableViewCell")
    }
    
    @IBAction func addEmployeeRecord(_ sender: Any) {
        secondViewController = (self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController)!
        
        secondViewController.empDelegate = self
        
        navigationController?.pushViewController(secondViewController, animated: true)
    }
}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        employeeTableViewCell = (self.employeeTableView.dequeueReusableCell(withIdentifier: "EmployeeTableViewCell", for: indexPath) as? EmployeeTableViewCell)!
        
        employeeTableViewCell.empFirstNameLabel.text = employees[indexPath.row].empFirstName
        employeeTableViewCell.empLastNameLabel.text = employees[indexPath.row].empLastName
        employeeTableViewCell.empIdLabel.text = employees[indexPath.row].empId.codingKey.stringValue
        
        return employeeTableViewCell ?? UITableViewCell()
    }
}

extension ViewController : BackDataPassing{
    func employeeDataToBePassed(employee: Employee) {
        employees.append(employee)
        employeeTableView.reloadData()
    }
}

extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        130.0
    }
}
