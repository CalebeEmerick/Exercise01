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
	
	private var mock: SignUpViewMock!
	private var presenter: SignUpPresenter!
	private var nameValidator: NameValidator!
	private var emailValidator: EmailValidator!
	private var cpfValidator: CPFValidator!
	
	override func setUp() {
		super.setUp()
		
		mock = SignUpViewMock()
		nameValidator = NameValidator()
		emailValidator = EmailValidator()
		cpfValidator = CPFValidator()
		presenter = SignUpPresenter(
			view: mock,
			nameValidator: nameValidator,
			emailValidator: emailValidator,
			cpfValidator: cpfValidator
		)
	}
	
	override func tearDown() {
		mock = nil
		nameValidator = nil
		emailValidator = nil
		cpfValidator = nil
		presenter = nil
		
		super.tearDown()
	}
	
	func test_shouldTintNameLineWhen_NameIsValid() {
		
		presenter.userNameChanged(to: "Nome Sobrenome")
		
		mock.verifyNameIsValid(for: .valid)
	}
	
	func test_shouldTintNameLineWhen_NameIsInvalid() {
		
		presenter.userNameChanged(to: "Nome")
		
		mock.verifyNameIsValid(for: .invalid)
	}
	
	func test_shouldTintEmailLineWhen_EmailIsValid() {
		
		presenter.userEmailChanged(to: "test@testing.com.br")
		
		mock.verifyEmailChange(for: .valid)
	}
	
	func test_shouldTintEmailLineWhen_EmailIsInvalid() {
		
		presenter.userEmailChanged(to: "test@testing..com.br")
		
		mock.verifyEmailChange(for: .invalid)
	}
	
	func test_shouldTintCpfLineWhen_CpfIsValid() {
		
		presenter.userCPFChanged(to: "144.130.507-62")
		
		mock.verifyCpfChanged(for: .valid)
	}
	
	func test_shouldTintCpfLineWhen_CpfIsInvalid() {
		
		presenter.userCPFChanged(to: "144.130.50762")
		
		mock.verifyCpfChanged(for: .invalid)
	}
	
	func test_confirmButtonShouldBeEnabled_WhenAllFieldsAreValid() {
		
		presenter.userNameChanged(to: "Name LastName")
		presenter.userEmailChanged(to: "test@testing.com")
		presenter.userCPFChanged(to: "144.130.507-62")
		
		XCTAssertTrue(mock.isConfirmButtonEnabled)
	}
	
	func test_confirmButtonShouldBeDisabled_WhenAtLeastOneFieldIsInvalid() {
		
		presenter.userNameChanged(to: "NameWrong")
		presenter.userEmailChanged(to: "test@testing.com")
		presenter.userCPFChanged(to: "144.130.507-62")
		
		XCTAssertFalse(mock.isConfirmButtonEnabled)
	}
	
	func test_shouldShowAlertWhen_ConfirmButtonIsTapped() {
		
		presenter.performValidation()
		
		mock.verifyAlertDoneButtonIsTapped()
	}
	
	func test_shouldClearAllFieldsWhen_AlertDoneButtonIsTapped() {
		
		presenter.resetViewState()
		
		mock.verifyAllFieldsIsEmpty()
	}
	
	func test_shouldDisableConfirmButtonWhen_AlertDoneButtonIsTapped() {
		
		presenter.resetViewState()
		
		mock.verifyConfirmButtonIsDisabled()
	}
	
	func test_shouldAllFieldsLineHaveTheDefaultColorWhen_AlertDoneButtonIsTapped() {
		
		presenter.resetViewState()
		
		let defaultColor = SignUpFieldState.default.color
			
		mock.verifyAllFieldsHave(color: defaultColor)
	}
}
