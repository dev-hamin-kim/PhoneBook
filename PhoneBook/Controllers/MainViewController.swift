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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        view = contactsTableView
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
    }
}

#Preview {
    MainViewController()
}
