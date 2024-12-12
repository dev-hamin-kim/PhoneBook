//
//  ContactsList.swift
//  PhoneBook
//
//  Created by 김하민 on 12/10/24.
//

class ContactsList {
    
    var Contacts: [Contact] = []
    
    func addNewContact(_ contact: Contact) {
        Contacts.append(contact)
    }
}

extension ContactsList {
    static let shared: ContactsList = {
        let contactList = ContactsList()
        contactList.Contacts = [
            Contact(name: "가나다", number: "010-2222-3333"),
            Contact(name: "Alex", number: "010-1414-2424"),
            Contact(name: "Betty", number: "010-5345-2323")
        ]
        return contactList
    }()
}
