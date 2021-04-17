//
//  DetailViewController.swift
//  Employee
//
//  Created by Karthik on 16/04/21.
//

import UIKit

class DetailViewController: UIViewController {

    var user :  User?
    
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var mobileNumber: UILabel!
    @IBOutlet weak var birthday: UILabel!
    
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var address: UILabel!
    
    @IBOutlet weak var contactPersonn: UILabel!
    
    @IBOutlet weak var cpmobileno: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let user = user else {
            return
        }
        title = user.firstname+" "+user.lastname
        
        firstName.text = "First  Name : \n"+user.firstname
        lastName.text = "Last Name :\n"+user.lastname
        id.text = "ID : \n" +  String(user.id)
        mobileNumber.text = "Mobile No :\n"+user.mobileno
        birthday.text="Birthday :  \n"+user.birthday
        email.text = "Email : \n"+user.email
        age.text = "Age : \n"+user.age
        address.text="Address :\n"+user.address
        contactPersonn.text="Contact Person :\n"+user.contactperson
        cpmobileno.text="Contact Person Mobile No : \n"+user.cpmobileno

    }
}

