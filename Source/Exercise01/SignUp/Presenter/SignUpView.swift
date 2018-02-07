//
//  SignUpView.swift
//  Exercise01
//
//  Created by Calebe Emerick on 03/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

protocol SignUpView : class {
	
	var isConfirmButtonEnabled: Bool { get }
	func enableConfirmButton()
	func disableConfirmButton()
	func onNameChange(with state: SignUpFieldState)
	func onEmailChange(with state: SignUpFieldState)
	func onCpfChange(with state: SignUpFieldState)
	func clearAllFields()
	func onReadyToValidate()
}
