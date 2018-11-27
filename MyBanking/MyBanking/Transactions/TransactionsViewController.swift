//
//  TransactionsViewController.swift
//  Banking
//
//  Created by Matteo Manferdini on 31/01/2017.
//  Copyright © 2017 Pure Creek. All rights reserved.
//

import UIKit
import MyReusableFramework

class TransactionsViewController: UIViewController {
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var totalLabel: UILabel!
	@IBOutlet weak var numberLabel: UILabel!
	
	var account: Account!
    var selectedIndex: Int!
	var stateController: StateController!
	
	fileprivate var dataSource: TransactionsDataSource!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		numberLabel.text = String(account.number).accountNumberFormatting
		navigationItem.title = account.name
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		totalLabel.text = account.total.dollarsFormatting
        stateController.fetchTransactions(account.number)
        
        //reload account after fetching transactions
        account = stateController.accounts[selectedIndex]
        print("TransactionView: is account loaded with transactions \(account)")
        
		dataSource = TransactionsDataSource(transactions: account.transactions)
		tableView.dataSource = dataSource
		tableView.reloadData()
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let navigationController = segue.destination as? UINavigationController,
			let createTransactionViewController = navigationController.viewControllers.first as? CreateTransactionViewController {
			createTransactionViewController.delegate = self
            createTransactionViewController.accountId = account.number
		}
	}
	
	@IBAction func cancelTransactionCreation(_ segue: UIStoryboardSegue) {}
	@IBAction func saveTransaction(_ segue: UIStoryboardSegue) {}
}

extension TransactionsViewController: CreateTransactionViewControllerDelegate {
	func add(newTransaction: Transaction2) {
		//account.transactions.append(newTransaction)
		//stateController.update(account)
        stateController.addTransaction(newTransaction, account.number)
	}
}
