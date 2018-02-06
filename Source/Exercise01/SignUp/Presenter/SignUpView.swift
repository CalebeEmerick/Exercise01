//
//  SignUpView.swift
//  Exercise01
//
//  Created by Calebe Emerick on 03/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

protocol SignUpView : class {
	
	func onNameChange(with state: SignUpLineState)
	func onEmailChange(with state: SignUpLineState)
	func onCpfChange(with state: SignUpLineState)
	func onReadyToValidate()
}
