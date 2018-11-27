//
//  CreateAccountViewController.swift
//  Banking
//
//  Created by Matteo Manferdini on 30/01/2017.
//  Copyright © 2017 Pure Creek. All rights reserved.
//

import UIKit
import MyReusableFramework

class CreateAccountViewController: UIViewController {
	@IBOutlet fileprivate weak var nameTextField: UITextField!
	@IBOutlet fileprivate weak var bankTextField: UITextField!
	@IBOutlet fileprivate weak var numberTextField: UITextField!
	
	var stateController: StateController!
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		guard segue.identifier == "SaveAccountSegue" else {
			return
		}
        
        let idString = numberTextField.text ?? "100"
        let id = Int(idString)
        
        let nameString = nameTextField.text ?? ""
        let bankString = bankTextField.text ?? ""
        
        let account = Account(number: id!, name: nameString, bank: bankString)
        
		stateController.addAccount(account)
	}
}
