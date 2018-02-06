//
//  SignUpControllerView.swift
//  Exercise01
//
//  Created by Calebe Emerick on 01/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

// MARK: - Initializer -

final class SignUpControllerView: UIView {
	
	@IBOutlet private var nameField: UITextField!
	@IBOutlet private var emailField: UITextField!
	@IBOutlet private var cpfField: UITextField!
	@IBOutlet private var confirmButton: UIButton!
	
	@IBAction private func fieldDidChanged(_ textField: UITextField) {
		validate(textField: textField)
	}
	
	private(set) var nameLine: CALayer!
	private(set) var emailLine: CALayer!
	private(set) var cpfLine: CALayer!
}

// MARK: - Life Cycle -

extension SignUpControllerView {
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		setFieldsDelegate()
		setBarAboveCpfField()
		setFieldsLine()
	}
}

// MARK: - Methods -

extension SignUpControllerView {
	
	private func setFieldsDelegate() {
		nameField.delegate = self
		emailField.delegate = self
		cpfField.delegate = self
	}
	
	private func setFieldsLine() {
		nameLine = makeBottomLine(with: nameField.frame)
		emailLine = makeBottomLine(with: emailField.frame)
		cpfLine = makeBottomLine(with: cpfField.frame)
	}
	
	private func validate(textField: UITextField) {
		if textField == nameField {
			
		}
		else if textField == emailField {
			
		}
		else {
			
		}
	}
	
	private func changeFieldFocus(from textField: UITextField) {
		if textField == nameField {
			emailField.becomeFirstResponder()
		}
		else if textField == emailField {
			cpfField.becomeFirstResponder()
		}
		else {
			dismissKeyboard(for: textField)
		}
	}
	
	private func setBarAboveCpfField() {
		let doneWidth: CGFloat = 100
		let doneRightPadding: CGFloat = 15
		let barFrame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44)
		let doneX = barFrame.width - doneWidth - doneRightPadding
		let doneFrame = CGRect(x: doneX, y: 0, width: doneWidth, height: barFrame.height)
		let bar = UIView(frame: barFrame)
		let done = UIButton(frame: doneFrame)
		let barBackgroundColor = UIColor(red: 245 / 255, green: 245 / 255, blue: 245 / 255, alpha: 1)
		let doneColor = UIColor(red: 55 / 255, green: 55 / 255, blue: 55 / 255, alpha: 1)
		done.setTitle("Concluído", for: .normal)
		done.setTitleColor(doneColor, for: .normal)
		bar.backgroundColor = barBackgroundColor
		bar.addSubview(done)
		done.addTarget(self, action: #selector(dismissCpfFieldKeyboard), for: .touchUpInside)
		cpfField.inputAccessoryView = bar
	}
	
	private func dismissKeyboard(for textField: UITextField) {
		DispatchQueue.main.async {
			textField.endEditing(true)
		}
	}
	
	private func makeBottomLine(with frame: CGRect) -> CALayer {
		let line = CALayer()
		let y = frame.origin.y + frame.height
		line.frame = CGRect(x: frame.origin.x, y: y, width: frame.width, height: 1)
		line.backgroundColor = SignUpFieldState.default.color
		layer.addSublayer(line)
		return line
	}
	
	@objc private func dismissCpfFieldKeyboard() {
		dismissKeyboard(for: cpfField)
	}
}

// MARK: - UITextFieldDelegate -

extension SignUpControllerView: UITextFieldDelegate {
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		
		changeFieldFocus(from: textField)
		
		return true
	}
}

// MARK: - SignUpView -

extension SignUpControllerView: SignUpView {
	
	var isConfirmButtonEnabled: Bool {
		return confirmButton.isEnabled
	}
	
	func enableConfirmButton() {
		confirmButton.isEnabled = true
	}
	
	func disableConfirmButton() {
		confirmButton.isEnabled = false
	}
	
	func onNameChange(with state: SignUpFieldState) {
		nameLine.backgroundColor = state.color
	}
	
	func onEmailChange(with state: SignUpFieldState) {
		emailLine.backgroundColor = state.color
	}
	
	func onCpfChange(with state: SignUpFieldState) {
		cpfLine.backgroundColor = state.color
	}
	
	func onReadyToValidate() {
		
	}
}
