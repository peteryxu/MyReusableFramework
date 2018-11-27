//
//  Formatting.swift
//  Banking
//
//  Created by Matteo Manferdini on 02/02/2017.
//  Copyright © 2017 Pure Creek. All rights reserved.
//

import Foundation
import UIKit

extension Float {
	var dollarsFormatting: String {
		let formatter = NumberFormatter()
		formatter.numberStyle = .currency
		formatter.currencySymbol = "$"
		return formatter.string(from: NSNumber(value: self))!
	}
}

extension Decimal {
    var dollarsFormatting: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "$"
        return formatter.string(from: self as NSDecimalNumber)!
    }
}

extension String {
	var accountNumberFormatting: String {
		var formattedString = ""
		for (index, character) in characters.enumerated() {
			if index % 4 < 3 || index == characters.count - 1 {
				formattedString.append(character)
			} else {
				formattedString.append("\(character) ")
			}
		}
		return formattedString
	}
}

extension Date {
	var transactionFormtting: String {
		let formatter = DateFormatter()
		formatter.dateStyle = .medium
		formatter.timeStyle = .none
		return formatter.string(from: self)
	}
}
