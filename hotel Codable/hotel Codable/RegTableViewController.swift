//
//  RegTableViewController.swift
//  hotel Codable
//
//  Created by student on 10/04/24.
//

import UIKit

class RegTableViewController: UITableViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var checkInDetailLabel: UILabel!
    
    @IBOutlet weak var checkOutDetailLabel: UILabel!
    
    @IBOutlet weak var checkindatePicker: UIDatePicker!
    
    
    @IBOutlet weak var checkOutDatePicker: UIDatePicker!
    
    
//    let sampleIndex = IndexPath()
    let checkiNdatelabelIndexPath = IndexPath(row: 0, section: 1)
    let checkoutdatelabelIndexPath = IndexPath(row: 2, section: 1)
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let midnight = Calendar.current.startOfDay(for: Date())
//        let checkOutday =  /*Calendar.current.date(byAdding: .day,value: 1, to: checkindatePicker.date)*/
        checkindatePicker.minimumDate = midnight
        updateViews()
        
       

        
    }

    @IBAction func doneButton(_ sender: UIBarButtonItem) {
        
        
        let name = nameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        
        print(name)
        print(email)
        
        
        
        
    }
    
    @IBAction func datesChanged(_ sender: UIDatePicker) {
        updateViews()
    }
    
    
    func updateViews(){
        checkOutDatePicker.minimumDate = Calendar.current.date(byAdding: .day,value: 1, to: checkindatePicker.date)
        
        
        checkInDetailLabel.text = checkindatePicker.date.formatted(date: .abbreviated, time: .omitted)
        checkOutDetailLabel.text = checkOutDatePicker.date.formatted(date: .abbreviated, time: .omitted)
//        print(midnight)
        
        
        
        
    }   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath == checkiNdatelabelIndexPath || indexPath == checkoutdatelabelIndexPath){
            print("yes")
            
        }
    }
    
    
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        print()
//    }
    
    
    
    // MARK: - Table view data source

   

  

}
