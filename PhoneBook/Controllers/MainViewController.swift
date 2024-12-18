//
//  MainViewController.swift
//  PhoneBook
//
//  Created by 김하민 on 12/9/24.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    
    private lazy var contactsTableView: ContactsTableView = .init()
    private let model: ContactsList = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        view = contactsTableView
    }
    
    // TO-DO - needs refactoring.
    // Reload table only when the model has changed. (by using observer?)
    override func viewWillAppear(_ animated: Bool) {
        contactsTableView.reloadTableView()
    }
    
    private func setNavigationBar() {
        navigationItem.title = "친구 목록"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "추가",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(onTap))
    }
    
}

extension MainViewController {
    @objc private func onTap() {
        print("탭")
        navigationController?.pushViewController(AddContactViewController(), animated: true)
    }
}

#Preview {
    MainViewController()
}
