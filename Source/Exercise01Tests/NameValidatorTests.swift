//
//  NameValidatorTests.swift
//  Exercise01Tests
//
//  Created by Calebe Emerick on 01/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

@testable import Exercise01
import XCTest

final class NameValidatorTests : XCTestCase {
	
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
		
		let name = "asg"
		
		let result = sut.validate(text: name)
		
		print()
		print()
		print(result.1)
		print()
		print()
		
		XCTAssertTrue(!result.0)
	}
	
	func testMoreCharactersThanAllowed() {
		
		let name = "okdpakdpoasopdkaspodkopaposkd posdapokdpkdpakpdkasdsapodksk"
		
		let result = sut.validate(text: name)
		
		print()
		print()
		print(result.1)
		print()
		print()
		
		XCTAssertTrue(result.0)
	}
	
	func testNameWithoutLastName() {
		
		let name = "asdddd ."
		
		let result = sut.validate(text: name)
		
		print()
		print()
		print(result.1)
		print()
		print()
		
		XCTAssertTrue(result.0)
	}
}
