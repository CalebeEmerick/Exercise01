//
//  SignUpPresenterTests.swift
//  Exercise01Tests
//
//  Created by Calebe Emerick on 03/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

@testable import Exercise01
import XCTest

final class SignUpPresenterTests: XCTestCase {
	
	private var controller: SignUpController!
	private var presenter: SignUpPresenter!
	private var nameValidator: NameValidator!
	private var emailValidator: EmailValidator!
	private var cpfValidator: CPFValidator!
	
	override func setUp() {
		super.setUp()
		
		controller = SignUpController(title: "Test")
		_ = controller.view
		nameValidator = NameValidator()
		emailValidator = EmailValidator()
		cpfValidator = CPFValidator()
		presenter = SignUpPresenter(view: controller.rootView, nameValidator: nameValidator, emailValidator: emailValidator, cpfValidator: cpfValidator)
	}
	
	override func tearDown() {
		controller = nil
		nameValidator = nil
		emailValidator = nil
		cpfValidator = nil
		presenter = nil
		
		super.tearDown()
	}
	
	func test_shoulChangeTheLineNameToGreen_WhenNameIsValid() {
		
		let name = "Calebe"
		
		presenter.userNameChanged(to: name)
		
		XCTAssertEqual(controller.rootView.nameLine.backgroundColor, SignUpLineState.invalid.color.cgColor)
	}
}
