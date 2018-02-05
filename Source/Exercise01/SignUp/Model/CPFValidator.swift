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
			isValidFormat(cpf: cpf),
			islogicallyValid(cpf: cpf),
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
	
	private func isValidFormat(cpf: String) -> Bool {
		let pattern = "^(([0-9]{3}.[0-9]{3}.[0-9]{3}-[0-9]{2})|([0-9]{11}))$"
		let regex = try? NSRegularExpression(pattern: pattern, options: [])
		let range = NSRange(location: 0, length: cpf.count)
		let numberOfMatches = regex?.numberOfMatches(in: cpf, options: [], range: range) ?? 0
		return numberOfMatches > 0
	}
	
	private func getOnlyStringNumbers(cpf: String) -> String {
		let pattern = "[.-]"
		let stringNumbers = cpf.replacingOccurrences(of: pattern, with: "", options: .regularExpression, range: nil)
		return stringNumbers
	}
	
	private func getCpfNumbers(cpf: String) -> [Int] {
		let stringNumbers = getOnlyStringNumbers(cpf: cpf)
		return stringNumbers.flatMap { Int(String($0)) }
	}
	
	private func islogicallyValid(cpf: String) -> Bool {
		let numbers = getCpfNumbers(cpf: cpf)
		guard numbers.count == 11 else { return false }
		let firstBlock = 11 - (numbers[0] * 10 +
			numbers[1] * 9 +
			numbers[2] * 8 +
			numbers[3] * 7 +
			numbers[4] * 6 +
			numbers[5] * 5 +
			numbers[6] * 4 +
			numbers[7] * 3 +
			numbers[8] * 2) % 11
		let dv1 = firstBlock > 9 ? 0 : firstBlock
		let secondBlock = 11 - (numbers[0] * 11 +
			numbers[1] * 10 +
			numbers[2] * 9 +
			numbers[3] * 8 +
			numbers[4] * 7 +
			numbers[5] * 6 +
			numbers[6] * 5 +
			numbers[7] * 4 +
			numbers[8] * 3 +
			numbers[9] * 2) % 11
		let dv2 = secondBlock > 9 ? 0 : secondBlock
		return dv1 == numbers[9] && dv2 == numbers[10]
	}
}
