//
//  NameValidator.swift
//  Exercise01
//
//  Created by Calebe Emerick on 01/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

final class NameValidator {
	
	func validate(text: String) -> Bool {
		
		guard hasLessCharactersThanAllowed(for: text) else {
			return false
		}
		
		guard hasMoreCharactersThanAllowed(for: text) else {
			return false
		}
		
		let names = getArrayOfNames(for: text)
		
		guard hasNameAndLastName(for: names) else {
			return false
		}
		
		let fullName = getNameAndLast(for: names)
		
		guard hasMinimunCharacter(for: fullName.name) else {
			return false
		}
		
		guard hasMinimunCharacter(for: fullName.lastName) else {
			return false
		}
		
		return true
	}
	
	private func hasLessCharactersThanAllowed(for text: String) -> Bool {
		return text.count >= 5
	}
	
	private func hasMoreCharactersThanAllowed(for text: String) -> Bool {
		return text.count <= 61
	}
	
	private func getArrayOfNames(for text: String) -> [String] {
		return text.split(separator: " ").map { String($0) }
	}
	
	private func hasNameAndLastName(for names: [String]) -> Bool {
		return names.count == 2
	}
	
	private func getNameAndLast(for names: [String]) -> (name: String, lastName: String) {
		return (name: names[0], lastName: names[1])
	}
	
	private func hasMinimunCharacter(for name: String) -> Bool {
		return name.count > 1
	}
}
