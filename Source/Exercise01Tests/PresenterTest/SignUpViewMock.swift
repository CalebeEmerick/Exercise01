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
	
	private var map: [String: SignUpFieldState] = [:]
	private var confirmButtonState = false
}

extension SignUpViewMock {
	
	func verifyNameIsValid(for state: SignUpFieldState) {
		
		guard let storageState = map["onNameChange"] else {
			fatalError("O método 'onNameChange' não foi chamado.")
		}
		
		XCTAssertEqual(state, storageState)
	}
	
	func verifyNameIsInvalid(for state: SignUpFieldState) {
		
		guard let storageState = map["onNameChange"] else {
			fatalError("O método 'onNameChange' não foi chamado.")
		}
		
		XCTAssertEqual(state, storageState)
	}
	
	func verifyEmailChange(for state: SignUpFieldState) {
		
		guard let storageState = map["onEmailChange"] else {
			fatalError("O método 'onEmailChange' não foi chamado.")
		}
		
		XCTAssertEqual(state, storageState)
	}
	
	func verifyCpfChanged(for state: SignUpFieldState) {
		
		guard let storageState = map["onCpfChange"] else {
			fatalError("O método 'onCpfChange' não foi chamado.")
		}
		
		XCTAssertEqual(state, storageState)
	}
}

extension SignUpViewMock: SignUpView {
	
	var isConfirmButtonEnabled: Bool {
		return confirmButtonState
	}
	
	func enableConfirmButton() {
		confirmButtonState = true
	}
	
	func disableConfirmButton() {
		confirmButtonState = false
	}
	
	func onNameChange(with state: SignUpFieldState) {
		map["onNameChange"] = state
	}
	
	func onEmailChange(with state: SignUpFieldState) {
		map["onEmailChange"] = state
	}
	
	func onCpfChange(with state: SignUpFieldState) {
		map["onCpfChange"] = state
	}
	
	func onReadyToValidate() {
		
	}
}
