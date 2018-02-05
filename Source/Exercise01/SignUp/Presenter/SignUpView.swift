//
//  SignUpView.swift
//  Exercise01
//
//  Created by Calebe Emerick on 03/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

protocol SignUpView : class {
	
	func onNameValidTint(line color: CGColor)
	func onEmailValidTint(line color: CGColor)
	func onCpfValidTint(line color: CGColor)
	
	func onNameInvalidTint(line color: CGColor)
	func onEmailInvalidTint(line color: CGColor)
	func onCpfInvalidTint(line color: CGColor)
	
	func onReadyToValidate()
}
