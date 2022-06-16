//
//  NewContactViewController.swift
//  L6_DelegationApp
//
//  Created by Vitaly Zubenko on 24.05.2022.
//
//  viewDidLoad можно удалить сразу, не нужно тут

import UIKit

protocol NewContactViewControllerDelegate: AnyObject {
    func saveContact(fullName: String)
}

protocol FullyNameProtocol {
    var fullName: String { get }
}

class NewContactViewController: UIViewController, FullyNameProtocol {
    
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    
    // теперь создадим объект этого делегата
    weak var delegate: NewContactViewControllerDelegate?

    var fullName: String {
        let person = Person(
            name: firstNameTextField.text ?? "",
            surname: lastNameTextField.text ?? ""
        )
        
        return "\(person.name) \(person.surname)"
    }
        
    @IBAction func doneButtonPressed() {
        delegate?.saveContact(fullName: fullName)
        dismiss(animated: true)
    }
    
    @IBAction func cancelButtonPressed() {
        dismiss(animated: true)
    }
    
}
