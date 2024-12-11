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
    }
    
    private func bind() {
        model.imageDidChange = { [unowned self] image in
            self.addContactView.setProfileImage(to: image)
        }
    }
}


extension AddContactViewController: AddContactViewDelegate {

    func setRandomImage() {
        model.setRandomImage()
    }
}
