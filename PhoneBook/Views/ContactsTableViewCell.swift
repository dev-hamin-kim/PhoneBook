//
//  ContactsTableViewCell.swift
//  PhoneBook
//
//  Created by 김하민 on 12/6/24.
//

import UIKit
import SnapKit

protocol ContactsTableViewCellDelegate: AnyObject {
    
}

final class ContactsTableViewCell: UITableViewCell {
    
    weak var delegate: ContactsTableViewCellDelegate?
    
    static let id = "ContactsTableViewCell"
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemBackground
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .label
        return label
    }()
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .label
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setTableViewCell()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCellData(with contact: Contact) {
        self.nameLabel.text = contact.name
        self.numberLabel.text = contact.number
        self.profileImageView.image = UIImage(systemName: "person.circle")
    }
    
    private func setTableViewCell() {
        contentView.backgroundColor = .systemBackground
        
        [
            profileImageView,
            nameLabel,
            numberLabel
        ].forEach { contentView.addSubview($0) }
    }
    
    private func setConstraints() {
        profileImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(20)
            make.height.equalToSuperview()
            make.width.equalTo(self.snp.height)
        }
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(profileImageView.snp.trailing).offset(20)
        }
        numberLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(30)
        }
    }
}
