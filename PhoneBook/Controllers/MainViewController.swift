//
//  MainViewController.swift
//  PhoneBook
//
//  Created by 김하민 on 12/9/24.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    
    let contactsTableView: ContactsTableView = .init()
    
    private let navItem: UINavigationItem = {
        let item = UINavigationItem()
        item.title = "친구 목록"
        return item
    }()
    
    private let navigationBar: UINavigationBar = {
        let navigationBar = UINavigationBar()
        navigationBar.barStyle = .default
        navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        return navigationBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(navigationBar)
        view.addSubview(contactsTableView)
        
        setNavigationBar()
        setConstraints()
    }
    
    private func setNavigationBar() {
        navigationBar.setItems([navItem], animated: true)
        navItem.rightBarButtonItem = UIBarButtonItem(title: "추가",
                                                     style: .plain,
                                                     target: MainViewController(),
                                                     action: #selector(onTap))
    }
    
    private func setConstraints() {
        let safeArea = self.view.safeAreaLayoutGuide
        
        navigationBar.snp.makeConstraints { make in
            make.top.equalTo(safeArea.snp.top)
            make.leading.trailing.equalToSuperview()
        }
        
        contactsTableView.snp.makeConstraints { make in
            make.top.equalTo(navigationBar.snp.bottom)
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
    }
    
    @objc private func onTap() {
        print("탭")
    }
    
}

#Preview {
    MainViewController()
}
