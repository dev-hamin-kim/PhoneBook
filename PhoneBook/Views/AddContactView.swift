//
//  AddContactView.swift
//  PhoneBook
//
//  Created by 김하민 on 12/10/24.
//

import UIKit
import SnapKit

protocol AddContactViewDelegate: AnyObject, UITextFieldDelegate {
    func setRandomImage()
    func saveContact(name: String, number: String)
}

final class AddContactView: UIView, UITextFieldDelegate {
    
    weak var delegate: AddContactViewDelegate?
    
    weak var delegate: AddContactViewDelegate?
    
    private let profileImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private let generateRandomImageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("랜덤 이미지 생성", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        return button
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .default
        textField.returnKeyType = .done
        textField.borderStyle = .roundedRect
        textField.placeholder = "이름"
        textField.clearButtonMode = .whileEditing
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.spellCheckingType = .no
        return textField
    }()
    
    private let numberTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .phonePad
        textField.returnKeyType = .done
        textField.borderStyle = .roundedRect
        textField.placeholder = "전화번호"
        textField.clearButtonMode = .whileEditing
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .systemBackground
        setupViewComponents()
        self.profileImage.image = UIImage(systemName: "person.circle")
        setConstraints()
        generateRandomImageButton.addTarget(self,
                                            action: #selector(setRandomImage),
                                            for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDelegate(to target: AddContactViewDelegate) {
        self.delegate = target
        nameTextField.delegate = target
        numberTextField.delegate = target
    }
    
    func setProfileImage(to image: UIImage) {
        DispatchQueue.main.async {
            self.profileImage.image = image
        }
    }
    
    func saveContact() {
        guard let name = nameTextField.text,
              let number = numberTextField.text else { return }
        
        delegate?.saveContact(name: name, number: number)
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
            make.height.equalTo(50)
        }
        numberTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(50)
        }

    }
    
    @objc private func setRandomImage() {
        delegate?.setRandomImage()
        print("setRandomImage button tapped")
    }
}
