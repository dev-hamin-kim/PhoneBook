//
//  ContactsTableViewCell.swift
//  PhoneBook
//
//  Created by 김하민 on 12/6/24.
//

import UIKit
import SnapKit

final class ContactsTableViewCell: UITableViewCell {
    
    static let id = "ContactsTableViewCell"
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.layer.borderWidth = 30
        imageView.layer.borderColor = .none
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "홍길동"
        label.textColor = .black
        return label
    }()
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.text = "010-1234-5678"
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        contentView.backgroundColor = .black
        
        [
            profileImageView,
            nameLabel,
            numberLabel
        ].forEach { contentView.addSubview($0) }
        
        setConstraints()
    }
    
    private func setConstraints() {
        profileImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(20)
        }
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(profileImageView.snp.trailing).offset(30)
        }
        numberLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(20)
        }
    }
}
