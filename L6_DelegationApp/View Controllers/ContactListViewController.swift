//
//  ViewController.swift
//  L6_DelegationApp
//
//  Created by Vitaly Zubenko on 24.05.2022.
//

import UIKit

class ContactListViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    private(set) var contacts: [String] = []
    
//  мы должны теперь сказать NewContacts про делегат и как-то реализовать его все таки
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newContactVC = segue.destination as! NewContactViewController
        newContactVC.delegate = self
    }
}

extension ContactListViewController: NewContactViewControllerDelegate {
    func saveContact(fullName: String) {
        contacts.append(fullName)
    }
}
