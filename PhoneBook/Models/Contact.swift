//
//  Contact.swift
//  PhoneBook
//
//  Created by 김하민 on 12/9/24.
//

import UIKit
import Kingfisher

class Contact {
    var name: String?
    var number: String?
    var profileImage: UIImage = UIImage(systemName: "person.circle")! {
        didSet {
            imageDidChange?(profileImage)
        }
    }
    
    var imageDidChange: ((UIImage) -> ())? = { _ in }
    
    init(name: String? = nil, number: String? = nil) {
        self.name = name
        self.number = number
    }
    
    func setProfile(with image: UIImage) {
        profileImage = image
    }
    
    
    
    // TO-DO: call setRandomImage beforehands to reduce delay from fetching the image from the network.
    // (i.e. when the view is about to load, or after setRandomImageButton has been pressed.
    // -- in other words, prepare the image before it is needed.)
    func setRandomImage() {
        let randomNumber = Int.random(in: 1...1000)
        guard let url = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(randomNumber).png") else { return }
        
        KingfisherManager.shared.retrieveImage(with: url) { result in
            switch result {
            case .success(let value):
                self.profileImage = value.image
                print(value.cacheType)
            case .failure(let error): print("Failed to fetch image: \(error)")
            }
        }
    }

}


