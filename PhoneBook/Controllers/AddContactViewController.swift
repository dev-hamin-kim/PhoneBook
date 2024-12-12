//
//  AddContactViewController.swift
//  PhoneBook
//
//  Created by 김하민 on 12/9/24.
//

import UIKit

final class AddContactViewController: UIViewController {
    
    private lazy var addContactView: AddContactView = .init()
    private var model: Contact = .init()
    
    override func loadView() {
        addContactView.setDelegate(to: self)
        view = addContactView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        setNavigationBar()
    }
    
    private func setNavigationBar() {
        navigationItem.title = "연락처 추가"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(onTap))
    }
    
    private func bind() {
        model.imageDidChange = { [unowned self] image in
            self.addContactView.setProfileImage(to: image)
        }
    }
}

extension AddContactViewController {
    @objc private func onTap() {
        addContactView.saveContact()
        ContactsList.shared.addNewContact(model)
        navigationController?.popViewController(animated: true)
    }
}

extension AddContactViewController: AddContactViewDelegate, UITextFieldDelegate {
    

    func setRandomImage() {
        model.setRandomImage()
    }
    
    func saveContact(name: String, number: String) {
        model.name = name
        model.number = number
    }
    
    
    // Called when the user begins editing
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("User started editing")
    }
    
    // Called when the user ends editing
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("User finished editing")
    }
}
