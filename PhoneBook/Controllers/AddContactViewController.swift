//
//  AddContactViewController.swift
//  PhoneBook
//
//  Created by 김하민 on 12/9/24.
//

import UIKit

final class AddContactViewController: UIViewController {
    
    private lazy var addContactView: AddContactView = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = addContactView
    }
}
