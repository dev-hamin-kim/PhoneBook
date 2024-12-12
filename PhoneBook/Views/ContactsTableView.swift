//
//  ContactsTableView.swift
//  PhoneBook
//
//  Created by 김하민 on 12/6/24.
//

import UIKit
import SnapKit

protocol ContactsTableViewDelegate: AnyObject, UITableViewDataSource, UITableViewDelegate {
    
}

final class ContactsTableView: UIView {
    
    weak var delegate: ContactsTableViewDelegate?

    private let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setTableView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setTableView() {
        tableView.register(ContactsTableViewCell.self, forCellReuseIdentifier: ContactsTableViewCell.id)
        tableView.dataSource = delegate
        tableView.delegate = delegate
        tableView.separatorStyle = .singleLine
        tableView.rowHeight = 80
        self.addSubview(tableView)
    }
    
    private func setConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
}

extension MainViewController: ContactsTableViewDelegate, ContactsTableViewCellDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coreDataRepository.contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactsTableViewCell.id, for: indexPath) as! ContactsTableViewCell
        cell.delegate = self
        let contact = coreDataRepository.contacts[indexPath.row]
        cell.setCellData(with: Contact(name: contact.name, number: contact.number))
        return cell
    }
    
    
}
