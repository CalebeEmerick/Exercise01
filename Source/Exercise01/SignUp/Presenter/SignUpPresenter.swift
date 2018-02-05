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
	
	init(view: SignUpView, nameValidator: NameValidator, emailValidator: EmailValidator, cpfValidator: CPFValidator) {
		self.view = view
		self.nameValidator = nameValidator
		self.emailValidator = emailValidator
		self.cpfValidator = cpfValidator
	}
	
	func userNameChanged(to name: String) {
		if nameValidator.validate(text: name) {
			view.onNameValidTint(line: SignUpLineState.valid.color.cgColor)
		}
		else {
			view.onNameInvalidTint(line: SignUpLineState.invalid.color.cgColor)
		}
	}
	
	func userEmailChanged(to email: String) {
		
	}
	
	func userCPFChanged(to cpf: String) {
		
	}
	
	func performValidation() {
		
	}
}
