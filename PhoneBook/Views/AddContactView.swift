//
//  AddContactView.swift
//  PhoneBook
//
//  Created by 김하민 on 12/10/24.
//

import UIKit
import SnapKit

final class AddContactView: UIView {
    
    private let profileImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private let generateRandomImageButton: UIButton = {
        let button = UIButton()
        button.setTitle("랜덤 이미지 생성", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        return button
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .default
        textField.returnKeyType = .done
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let numberTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .phonePad
        textField.returnKeyType = .done
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .systemBackground
        setupViewComponents()
        self.profileImage.image = UIImage(systemName: "person.circle")
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewComponents() {
        [
            profileImage,
            generateRandomImageButton,
            nameTextField,
            numberTextField
        ].forEach { addSubview($0) }
    }
    
    private func setConstraints() {
        profileImage.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(100)
        }
        generateRandomImageButton.snp.makeConstraints { make in
            make.top.equalTo(profileImage.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(profileImage.snp.bottom).offset(70)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalTo(safeAreaLayoutGuide).inset(20)
        }
        numberTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalTo(safeAreaLayoutGuide).inset(20)
        }
    }
}

#Preview {
    AddContactView()
}