//
//  ViewController.swift
//  Contacts Task
//
//  Created by Aya Salman on 16/07/2025.
//

import UIKit

class ViewController: UIViewController {
   
    var contactsArray : [Contact] = []
    var filteredContacts: [Contact] = []
    var isSearching = false

    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var contactsTableView: UITableView!
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        isSearching = false
        searchBar.text = ""
        loadContacts()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        loadContacts()
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        searchBar.delegate = self
        
        
        if contactsArray.count == 0 {
            contactsTableView.isHidden = true
            let emptyImage = UIImageView(frame: CGRect(x: 50, y: 100, width: self.view.frame.width - 100, height: 200))
            emptyImage.image = UIImage(named: "icloud.slash")
            emptyImage.tintColor = UIColor.darkGray
            
            self.view.addSubview(emptyImage)
        }
        
    }
    
    

    func loadContacts() {
        if let data = UserDefaults.standard.data(forKey: "contacts"),
           let savedContacts = try? JSONDecoder().decode([Contact].self, from: data) {
            contactsArray = savedContacts
        } else {
            contactsArray = []
        }

        contactsTableView.reloadData()
        updateEmptyState()
    }
    func updateEmptyState() {
        if contactsArray.isEmpty {
            contactsTableView.isHidden = true
            let emptyImage = UIImageView(frame: CGRect(x: 50, y: 200, width: self.view.frame.width - 100, height: 200))
            emptyImage.image = UIImage(systemName: "icloud.slash") 
            emptyImage.tintColor = UIColor.darkGray
            emptyImage.tag = 999

            self.view.addSubview(emptyImage)
            
            let emptyLabel = UILabel(frame: CGRect(x: emptyImage.frame.minX, y: emptyImage.frame.maxY + 15, width: emptyImage.frame.width, height: 30))
            
            emptyLabel.text = "No Data To Display"
            emptyLabel.textAlignment = .center
            emptyLabel.tag = 998
            self.view.addSubview(emptyLabel)
            
            
        } else {
            contactsTableView.isHidden = false

            //Remove empty image and label
            self.view.viewWithTag(999)?.removeFromSuperview()
            self.view.viewWithTag(998)?.removeFromSuperview()
            
            
            }
        
        }
    }



extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearching ? filteredContacts.count : contactsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contact = isSearching ? filteredContacts[indexPath.row] : contactsArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactsCell", for: indexPath)
        
        let nameLabel = cell.viewWithTag(1) as? UILabel
        let phoneLabel = cell.viewWithTag(2) as? UILabel
        
        nameLabel?.text = contact.name
        phoneLabel?.text = contact.phone
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("hello")
        let contact =  isSearching ? filteredContacts[indexPath.row] : contactsArray[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailsVC = storyboard.instantiateViewController(withIdentifier: "contactDetailsID") as? ContactsDetailsViewController {
            detailsVC.contactDetail = contact
            navigationController?.pushViewController(detailsVC, animated: true)
           
        }
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { action, view, completionHandler in
            
            //Remove from the array
            self.contactsArray.remove(at: indexPath.row)
            
            //Update UserDefaults
            if let encodedData = try? JSONEncoder().encode(self.contactsArray) {
                UserDefaults.standard.set(encodedData, forKey: "contacts")
            }

            //Delete from table view
            self.contactsTableView.beginUpdates()
            self.contactsTableView.deleteRows(at: [indexPath], with: .automatic)
            self.contactsTableView.endUpdates()
            self.updateEmptyState()
            //Call the completion handler
            completionHandler(true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }

    
}

extension ViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isSearching = false
            filteredContacts = []
        } else {
            isSearching = true
            filteredContacts = contactsArray.filter { contact in
                return contact.name.lowercased().contains(searchText.lowercased()) ||
                       contact.phone.contains(searchText)
            }
        }
        contactsTableView.reloadData()
    }

}

