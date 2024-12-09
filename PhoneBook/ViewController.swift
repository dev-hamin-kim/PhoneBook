//
//  ViewController.swift
//  PhoneBook
//
//  Created by 김하민 on 12/6/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view = ContactsTableView()
    }


}

#Preview {
    ViewController()
}
