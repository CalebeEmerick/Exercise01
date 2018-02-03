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
		sut = nil
		super.tearDown()
	}
	
	func test_shouldNotAccept_EmptyString() {
		
		let name = ""
		
		let result = sut.validate(text: name)
		
		XCTAssertFalse(result, "O nome está vazio.")
	}
	
	func test_shouldNotAccept_LessCharactersThanAllowed() {
		
		let name = "lol"
		
		let result = sut.validate(text: name)
		
		XCTAssertFalse(result, "Menos caracteres que o permitido.")
	}
	
	func test_shouldNotAccept_MoreCharactersThanAllowed() {
		
		let name = "CalebeNomeGiganteGrandeGrandãoGRANDEMESMO CalebeNomeGiganteGrandeGrandão"
		
		let result = sut.validate(text: name)
		
		XCTAssertFalse(result, "Mais caracteres do que o permitido.")
	}
	
	func test_shouldNotAccept_NameWithoutLastName() {
		
		let name = "x Nome"
		
		let result = sut.validate(text: name)
		
		XCTAssertFalse(result, "Nome sem sobrenome")
	}
	
	func test_shouldNotAccept_LastNameWithoutName() {
		
		let name = "L Xa"
		
		let result = sut.validate(text: name)
		
		XCTAssertFalse(result, "Sobrenome sem Nome")
	}
	
	func test_shouldAccept_NameAndLastName() {
		
		let name = "Name LastName"
		
		let result = sut.validate(text: name)
		
		XCTAssertTrue(result)
	}
}
