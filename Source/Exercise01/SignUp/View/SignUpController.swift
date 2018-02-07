//
//  SignUpController.swift
//  Exercise01
//
//  Created by Calebe Emerick on 01/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

// MARK: - Initializer -

final class SignUpController: UIViewController {
	
	private let rootView: SignUpControllerView
	private let nameValidator: NameValidator
	private let emailValidator: EmailValidator
	private let cpfValidator: CPFValidator
	
	private lazy var presenter: SignUpPresenter = {
		return SignUpPresenter(view: rootView, nameValidator: nameValidator, emailValidator: emailValidator, cpfValidator: cpfValidator)
	}()
	
	init(title: String) {
		rootView = SignUpControllerView.makeXib()
		nameValidator = NameValidator()
		emailValidator = EmailValidator()
		cpfValidator = CPFValidator()
		
		super.init(nibName: nil, bundle: nil)
		
		self.title = title
		rootView.presenter = presenter
		rootView.controller = self
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		view = rootView
	}
}
