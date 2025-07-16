//
//  ContactsDetailsViewController.swift
//  Contacts Task
//
//  Created by Aya Salman on 16/07/2025.
//

import UIKit

class ContactsDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var nameDetailsLabel: UILabel!
    @IBOutlet weak var numberDetailsLabel: UILabel!
    
    var contactDetail : Contact!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameDetailsLabel.text = contactDetail?.name
        numberDetailsLabel.text = contactDetail?.phone
    }
    

}
