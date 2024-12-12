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
    let coreDataRepository = CoreDataRepository(modelName: "PhoneBook")
    
    override func loadView() {
        view = contactsTableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
    }
    
    // TO-DO - needs refactoring.
    // Reload table only when the model has changed. (by using observer?)
    override func viewWillAppear(_ animated: Bool) {
        fetchContacts()
        contactsTableView.reloadTableView()
        print(coreDataRepository.contacts.count)
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
        navigationController?.pushViewController(AddContactViewController(coreDataRepository: coreDataRepository), animated: true)
    }
    
    private func fetchContacts() {
        coreDataRepository.fetch()
    }
}

#Preview {
    MainViewController()
}
