//
//  SignUpPresenter.swift
//  Exercise01
//
//  Created by Calebe Emerick on 03/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

final class SignUpPresenter {
	
	private unowned let view: SignUpView
	private let nameValidator: NameValidator
	private let emailValidator: EmailValidator
	private let cpfValidator: CPFValidator
	
	private var nameState: SignUpFieldState = .default
	private var emailState: SignUpFieldState = .default
	private var cpfState: SignUpFieldState = .default
	
	init(view: SignUpView, nameValidator: NameValidator, emailValidator: EmailValidator, cpfValidator: CPFValidator) {
		self.view = view
		self.nameValidator = nameValidator
		self.emailValidator = emailValidator
		self.cpfValidator = cpfValidator
	}
	
	var isAllFieldsValid: Bool {
		return nameState == .valid && emailState == .valid && cpfState == .valid
	}
	
	func userNameChanged(to name: String) {
		let isNameValid = nameValidator.validate(text: name)
		nameState = SignUpFieldState(isValid: isNameValid)
		view.onNameChange(with: nameState)
		shouldEnableConfirmButton()
	}
	
	func userEmailChanged(to email: String) {
		let isEmailValid = emailValidator.validate(email: email)
		emailState = SignUpFieldState(isValid: isEmailValid)
		view.onEmailChange(with: emailState)
		shouldEnableConfirmButton()
	}
	
	func userCPFChanged(to cpf: String) {
		let isCpfValid = cpfValidator.validate(cpf: cpf)
		cpfState = SignUpFieldState(isValid: isCpfValid)
		view.onCpfChange(with: cpfState)
		shouldEnableConfirmButton()
	}
	
	func performValidation() {
		view.onReadyToValidate()
	}
	
	func resetViewState() {
		view.clearAllFields()
		view.disableConfirmButton()
		view.setFieldsLine(to: SignUpFieldState.default.color)
	}
	
	private func shouldEnableConfirmButton() {
		if isAllFieldsValid {
			enableConfirmButton()
		}
		else {
			disableConfirmButton()
		}
	}
	
	private func enableConfirmButton() {
		if !view.isConfirmButtonEnabled {
			view.enableConfirmButton()
		}
	}
	
	private func disableConfirmButton() {
		if view.isConfirmButtonEnabled {
			view.disableConfirmButton()
		}
	}
}
