📝 Contacts App

A clean and user-friendly iOS contacts manager built with UIKit and UserDefaults. Add, search, view, and delete contacts — all stored locally on-device with persistent storage.

---

🚀 Features

📇 Add new contacts with name and phone number  
🔍 Search contacts by name or number  
📋 View contact details in a separate screen  
🗑 Swipe to delete contacts with animation  
📴 Show a placeholder when contact list is empty  
🧠 Local data persistence using UserDefaults  
📱 Smooth, responsive UI using UIKit and Storyboards  
✅ Input validation for clean and safe data  

---

🧰 Technologies Used

- Swift 5.0  
- UIKit  
- UserDefaults  
- Storyboards  
- Auto Layout  
- MVC Architecture  

---

🛠 Architecture

This app follows the MVC pattern, organized into:

Model 
📁 `Contact.swift`: A simple struct conforming to `Codable`, storing name and phone.

View  
📁 Storyboard-based UI using `UITableView`, labels, and text fields.

Controller
📁 `ViewController.swift`: Displays contacts and handles search  
📁 `AddContactViewController.swift`: Form for creating new contacts with validation  
📁 `ContactsDetailsViewController.swift`: Shows full contact info

---

📂 Project Structure

- `Contact.swift`: Model representing a contact (name + phone number)  
- `ViewController.swift`: Main screen showing the list and search bar  
- `AddContactViewController.swift`: Input form to add new contact  
- `ContactsDetailsViewController.swift`: Details screen for contact info  
- `Main.storyboard`: UI layout for all screens   
- `AppDelegate.swift`, `SceneDelegate.swift`: App lifecycle and scene handling

---

📦 UserDefaults Operations

Create 
Saved after validating input and encoding contact using JSONEncoder.

Read 
Contacts are loaded from UserDefaults and decoded with JSONDecoder.

Delete 
Swipe to delete updates both the array and stored data.

---

🛠 Requirements

- iOS 13.0+  
- Xcode 14.2+  
- Swift 5.0+  
- UIKit-based project

---

📦 Installation

1. Clone this repository  
2. Open `ContactsApp.xcodeproj` in Xcode  
3. Build & run on simulator or real device

---

📱 Screens

![Screenshot](https://github.com/ayasalman/ContactsTask/issues/1#issue-3236797472)

![Screenshot](https://github.com/ayasalman/ContactsTask/issues/2#issue-3236803100)


![Screenshot](https://github.com/ayasalman/ContactsTask/issues/3#issue-3236806932)



![Screenshot](https://github.com/ayasalman/ContactsTask/issues/4#issue-3236810435)




![Screenshot](https://github.com/ayasalman/ContactsTask/issues/5#issue-3236813854)


![Screenshot](https://github.com/ayasalman/ContactsTask/issues/6#issue-3236816923)

![Screenshot](https://github.com/ayasalman/ContactsTask/issues/7#issue-3236818503)

![Screenshot](https://github.com/ayasalman/ContactsTask/issues/8#issue-3236829007)

![Screenshot](https://github.com/ayasalman/ContactsTask/issues/9#issue-3236830820)
![Screenshot](https://github.com/ayasalman/ContactsTask/issues/10#issue-3236832704)







---

📝 License

This project is open-source and available under the MIT License.

---

👩‍💻 Author

Aya – iOS Developer  
