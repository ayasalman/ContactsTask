//
//  AddContactViewController.swift
//  Contacts Task
//
//  Created by Aya Salman on 16/07/2025.
//

import UIKit

class AddContactViewController: UIViewController {
    
    var defaults = UserDefaults.standard
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func saveButton(_ sender: Any) {
        
        let name = nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let phone = phoneNumberTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        
        //Check both fields are not empty
        guard !name.isEmpty, !phone.isEmpty else {
            showAlert(message: "Please enter both name and phone number")
            return
        }
        
        //Check name has at least 3 characters
        guard name.count >= 3 else {
            showAlert(message: "Name must be at least 3 characters")
            return
        }
        
        //Check phone number is all digits
        let isDigitsOnly = phone.unicodeScalars.allSatisfy { CharacterSet.decimalDigits.contains($0) }
        guard isDigitsOnly else {
            showAlert(message: "Phone number must contain digits only")
            return
        }
        
        //Check phone number has exactly 10 digits
        guard phone.count == 10 else {
            showAlert(message: "Phone number must be exactly 10 digits")
            return
        }

        //Save to UserDefaults
        let newContact = Contact(name: name, phone: phone)
        var contacts = loadContacts()
        contacts.append(newContact)
        
        if let data = try? JSONEncoder().encode(contacts) {
            UserDefaults.standard.set(data, forKey: "contacts")
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    //Functions
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Invalid Input", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    
    func loadContacts() -> [Contact] {
        if let data = UserDefaults.standard.data(forKey: "contacts"),
           let contacts = try? JSONDecoder().decode([Contact].self, from: data) {
            return contacts
        }
        return []
    }
}
