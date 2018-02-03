//
//  EmailValidatorTests.swift
//  Exercise01Tests
//
//  Created by Calebe Emerick on 03/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

@testable import Exercise01
import XCTest

final class EmailValidatorTests: XCTestCase {
	
	private var sut: EmailValidator!
	
	override func setUp() {
		super.setUp()
		
		sut = EmailValidator()
	}
	
	override func tearDown() {
		sut = nil
		super.tearDown()
	}
	
	func test_shouldNotAccept_EmptyString() {
		
		let email = ""
		
		let result = sut.validate(email: email)
		
		XCTAssertFalse(result, "O Email está vazio.")
	}
	
	func test_shouldNotAccept_TwoAts() {
		
		let email = "test@@google.com"
		
		let result = sut.validate(email: email)
		
		XCTAssertFalse(result, "O Email não é válido.")
	}
	
	func test_shouldNotAccept_MissDomain() {
		
		let email = "test@.com"
		
		let result = sut.validate(email: email)
		
		XCTAssertFalse(result, "O Email não é válido.")
	}
	
	func test_shouldNotAccept_MissStringBeforeAt() {
		
		let email = "@google.com"
		
		let result = sut.validate(email: email)
		
		XCTAssertFalse(result, "O Email não é válido.")
	}
	
	func test_shouldNotAccept_DotBeforeAt() {
		
		let email = "test.@google.com"
		
		let result = sut.validate(email: email)
		
		XCTAssertFalse(result, "O Email não é válido.")
	}
	
	func test_shouldAccept_SomeSpecialCharacters() {
		
		let email = "t-$e.s%t-#2-%-.-0@google.com"
		
		let result = sut.validate(email: email)
		
		XCTAssertTrue(result, "Deveria aceitar caracteres especiais.")
	}
	
	func test_sholdAccept_validEmail() {
		
		let email = "test@testemail.com"
		
		let result = sut.validate(email: email)
		
		XCTAssertTrue(result)
	}
}
