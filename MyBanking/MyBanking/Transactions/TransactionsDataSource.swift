//
//  TransactionsDataSource.swift
//  Banking
//
//  Created by Matteo Manferdini on 31/01/2017.
//  Copyright © 2017 Pure Creek. All rights reserved.
//

import UIKit
import MyReusableFramework

class TransactionsDataSource: NSObject {
	let transactions: [Transaction]
	
	init(transactions: [Transaction]) {
		self.transactions = transactions
	}
}

extension TransactionsDataSource: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return transactions.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as! TransactionCell
		let transaction = transactions[indexPath.row]
        //print("getting transaction in tableview \(transaction)")
		cell.model = TransactionCell.Model(transaction: transaction)
		return cell
	}
}
