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
    let coreDataRepository: CoreDataRepository
    
    init(coreDataRepository: CoreDataRepository) {
        self.coreDataRepository = coreDataRepository
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        
        print(name, number)
        
        let contact = Entity(context: coreDataRepository.context)
        contact.name = model.name
        contact.number = model.number
        contact.profileImage = model.profileImage.pngData()
        
        coreDataRepository.save()
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
