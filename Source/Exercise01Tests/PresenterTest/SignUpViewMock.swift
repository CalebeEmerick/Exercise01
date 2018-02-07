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
	private var nameField = "Name LastName"
	private var emailField = "test@testing.com"
	private var cpfField = "14413050762"
	private var confirmButtonEnabled = true
	private var isAlertDoneButtonPressed = false
	private var nameLineColor = SignUpFieldState.valid.color
	private var emailLineColor = SignUpFieldState.valid.color
	private var cpfLineColor = SignUpFieldState.valid.color
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
	
	func verifyAllFieldsIsEmpty() {
		
		let isEmpty = nameField.isEmpty && emailField.isEmpty && cpfField.isEmpty
		
		XCTAssertTrue(isEmpty)
	}
	
	func verifyConfirmButtonIsDisabled() {
		
		XCTAssertFalse(confirmButtonEnabled)
	}
	
	func verifyAlertDoneButtonIsTapped() {
		
		XCTAssertTrue(isAlertDoneButtonPressed)
	}
	
	func verifyAllFieldsHave(color: CGColor) {
		
		let condition = nameLineColor == color &&
			emailLineColor == color &&
			cpfLineColor == color
		
		XCTAssertTrue(condition)
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
		confirmButtonEnabled = false
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
		isAlertDoneButtonPressed = true
	}
	
	func clearAllFields() {
		nameField = ""
		emailField = ""
		cpfField = ""
	}
	
	func setFieldsLine(to color: CGColor) {
		nameLineColor = color
		emailLineColor = color
		cpfLineColor = color
	}
}
