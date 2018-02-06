//
//  SignUpViewMock.swift
//  Exercise01Tests
//
//  Created by Calebe Emerick on 05/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

@testable import Exercise01
import XCTest

final class SignUpViewMock {
	
	var map: [String: SignUpLineState] = [:]
}

extension SignUpViewMock {
	
	func verifyNameIsValid(for state: SignUpLineState) {
		
		guard let storageState = map["onNameChange"] else {
			fatalError("O método 'onNameChange' não foi chamado.")
		}
		
		XCTAssertEqual(state, storageState)
	}
	
	func verifyNameIsInvalid(for state: SignUpLineState) {
		
		guard let storageState = map["onNameChange"] else {
			fatalError("O método 'onNameChange' não foi chamado.")
		}
		
		XCTAssertEqual(state, storageState)
	}
	
	func verifyEmailChange(for state: SignUpLineState) {
		
		guard let storageState = map["onEmailChange"] else {
			fatalError("O método 'onEmailChange' não foi chamado.")
		}
		
		XCTAssertEqual(state, storageState)
	}
	
	func verifyCpfChanged(for state: SignUpLineState) {
		
		guard let storageState = map["onCpfChange"] else {
			fatalError("O método 'onCpfChange' não foi chamado.")
		}
		
		XCTAssertEqual(state, storageState)
	}
}

extension SignUpViewMock: SignUpView {
	
	func onNameChange(with state: SignUpLineState) {
		map["onNameChange"] = state
	}
	
	func onEmailChange(with state: SignUpLineState) {
		map["onEmailChange"] = state
	}
	
	func onCpfChange(with state: SignUpLineState) {
		map["onCpfChange"] = state
	}
	
	func onReadyToValidate() {
		
	}
}
