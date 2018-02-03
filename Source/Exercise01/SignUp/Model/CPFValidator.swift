//
//  CPFValidator.swift
//  Exercise01
//
//  Created by Calebe Emerick on 02/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

final class CPFValidator {
	
	private let regularExpression = NSRegularExpression()
	
	func validate(cpf: String) -> Bool {
		
		let conditions = [
			!cpf.isEmpty,
			isCpfValidFormat(cpf: cpf),
			!blackList.contains(cpf)
		]
		
		return !conditions.contains(false)
	}
	
	private var blackList: [String] {
		return [
			"00000000000",
			"11111111111",
			"22222222222",
			"33333333333",
			"44444444444",
			"55555555555",
			"66666666666",
			"77777777777",
			"88888888888",
			"99999999999",
			"12345678909"
		]
	}
	
	private func isCpfValidFormat(cpf: String) -> Bool {
		let pattern = "^(([0-9]{3}.[0-9]{3}.[0-9]{3}-[0-9]{2})|([0-9]{11}))$"
		let regex = try? NSRegularExpression(pattern: pattern, options: [])
		let range = NSRange(location: 0, length: cpf.count)
		let numberOfMatches = regex?.numberOfMatches(in: cpf, options: [], range: range) ?? 0
		return numberOfMatches > 0
	}
}
