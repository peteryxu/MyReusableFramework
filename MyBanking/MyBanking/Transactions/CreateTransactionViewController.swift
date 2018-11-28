//
//  CreateTransactionViewController.swift
//  Banking
//
//  Created by Matteo Manferdini on 01/02/2017.
//  Copyright © 2017 Pure Creek. All rights reserved.
//

import UIKit
import MyReusableFramework

protocol CreateTransactionViewControllerDelegate: class {
	func add(newTransaction: Transaction2)
}

class CreateTransactionViewController: UIViewController {
	
	weak var delegate: CreateTransactionViewControllerDelegate?
    var accountId = ""
	
	var newTransactionView: NewTransactionView {
		return view as! NewTransactionView
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		guard segue.identifier == "SaveTransactionSegue" else {
			return
		}
        guard let amount = newTransactionView.amount,
			let description = newTransactionView.transactionDescription,
			let category = newTransactionView.selectedCategory else {
				return
		}
		//let transaction = Transaction(amount: amount, description: description, date: Date(), category: category)

        let transaction = Transaction2(amount: Decimal(floatLiteral: Double(amount)).roundedCurrency, description: description, date: Date(), category: category)
        
		delegate?.add(newTransaction: transaction)
	}
}
