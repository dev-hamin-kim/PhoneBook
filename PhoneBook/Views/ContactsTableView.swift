//
//  ContactsTableView.swift
//  PhoneBook
//
//  Created by 김하민 on 12/6/24.
//

import UIKit
import SnapKit

final class ContactsTableView: UIView, UITableViewDataSource, UITableViewDelegate {

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
        tableView.dataSource = self
        tableView.delegate = self
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Contact.Contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactsTableViewCell.id, for: indexPath) as! ContactsTableViewCell
        cell.setCellData(with: Contact.Contacts[indexPath.row])
        cell.delegate = self
        return cell
    }
}

extension ContactsTableView: ContactsTableViewCellDelegate {
    
}
