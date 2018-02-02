//
//  NameValidatorTests.swift
//  Exercise01Tests
//
//  Created by Calebe Emerick on 01/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

@testable import Exercise01
import XCTest

final class NameValidatorTests: XCTestCase {
	
	private var sut: NameValidator!
	
	override func setUp() {
		super.setUp()
		
		sut = NameValidator()
	}
	
	override func tearDown() {
		super.tearDown()
		
		sut = nil
	}
	
	func testLessCharactersThanAllowed() {
		
		let name = "lol"
		
		let result = sut.validate(text: name)
		
		XCTAssertFalse(result, "Menos caracteres que o permitido.")
	}
	
	func testMoreCharactersThanAllowed() {
		
		let name = "CalebeNomeGiganteGrandeGrandãoGRANDEMESMO CalebeNomeGiganteGrandeGrandão"
		
		let result = sut.validate(text: name)
		
		XCTAssertFalse(result, "Mais caracteres do que o permitido.")
	}
	
	func testNameWithoutLastName() {
		
		let name = "x Nome"
		
		let result = sut.validate(text: name)
		
		XCTAssertFalse(result, "Nome sem sobrenome")
	}
	
	func testLastNameWithoutName() {
		
		let name = "L Xa"
		
		let result = sut.validate(text: name)
		
		XCTAssertFalse(result, "Sobrenome sem Nome")
	}
	
	func testNameAndLastNameSuccess() {
		
		let name = "Name LastName"
		
		let result = sut.validate(text: name)
		
		XCTAssertTrue(result)
	}
}
