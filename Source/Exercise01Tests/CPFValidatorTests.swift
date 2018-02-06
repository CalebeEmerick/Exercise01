//
//  CPFValidatorTests.swift
//  Exercise01Tests
//
//  Created by Calebe Emerick on 02/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

@testable import Exercise01
import XCTest

final class CPFValidatorTests: XCTestCase {
	
	private var sut: CPFValidator!
	
	override func setUp() {
		super.setUp()
		
		sut = CPFValidator()
	}
	
	override func tearDown() {
		sut = nil
		super.tearDown()
	}
	
	func test_shouldNotAccept_EmptyString() {
		
		let cpf = ""
		
		let result = sut.validate(cpf: cpf)
		
		XCTAssertFalse(result, "O CPF está vazio.")
	}
	
	func test_shouldNotAccept_LessCharactersThanAllowed() {
		
		let cpf = "144130507"
		
		let result = sut.validate(cpf: cpf)
		
		XCTAssertFalse(result)
	}
	
	func test_shouldNotAccept_MoreCharactersThanAllowed() {
		
		let cpf = "144130507622"
		
		let result = sut.validate(cpf: cpf)
		
		XCTAssertFalse(result)
	}
	
	func test_shouldNotAccept_AnyOtherCharacterThanNumbers() {
		
		let cpf = "14413050762abc"
		
		let result = sut.validate(cpf: cpf)
		
		XCTAssertFalse(result)
	}
	
	func test_shouldNotAccept_FakeCPF() {
		
		let cpf = "00000000000"
		
		let result = sut.validate(cpf: cpf)
		
		XCTAssertFalse(result)
	}
	
	func test_shouldAccept_FormattedCPF() {
		
		let cpf = "144.130.507-62"
		
		let result = sut.validate(cpf: cpf)
		
		XCTAssertTrue(result)
	}
}
