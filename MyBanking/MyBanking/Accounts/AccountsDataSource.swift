//
//  AccountsDataSource.swift
//  Banking
//
//  Created by Matteo Manferdini on 30/01/2017.
//  Copyright © 2017 Pure Creek. All rights reserved.
//

import UIKit
import MyReusableFramework

class AccountsDataSource: NSObject {
	var accounts: [Account]
	
	init(accounts: [Account]) {
		self.accounts = accounts
	}
}

extension AccountsDataSource: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return accounts.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell", for: indexPath) as! AccountCell
		let index = indexPath.row
		let account = accounts[index]
		cell.model = AccountCell.Model(account: account, index: index)
		return cell
	}
}
