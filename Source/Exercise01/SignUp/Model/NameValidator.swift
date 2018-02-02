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
		
		guard text.count >= 5 else {
			return false
		}
		
		guard text.count <= 61 else {
			return false
		}
		
		let names = text.split(separator: " ")
		
		guard names.count == 2 else {
			return false
		}
		
		let name = names[0]
		let lastname = names[1]
		
		guard lastname.count > 1 else {
			return false
		}
		
		guard name.count > 1 else {
			return false
		}
		
		return true
	}
}
