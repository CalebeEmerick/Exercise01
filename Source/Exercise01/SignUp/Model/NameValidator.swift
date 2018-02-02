//
//  NameValidator.swift
//  Exercise01
//
//  Created by Calebe Emerick on 01/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import Foundation

final class NameValidator {
	
	func validate(text: String) -> (Bool, String) {

		// Tem de haver NOME e SOBRENOME separados por espaço
		
		let names = text.split(separator: " ")
		
		guard names.count == 2 else { return (false, "Deve possuir Nome e Sobrenome separados por um espaço.") }
		
		let name = names[0]
		let lastname = names[1]
		
		
		// Não pode haver menos que 4 caracteres
		
		guard name.count + lastname.count >= 4 else { return (false, "Não pode haver menos que 4 caracteres.") }
		
		
		// Não pode haver mais que 60 caracteres
		
		guard name.count + lastname.count <= 60 else { return (false, "Não pode haver mais que 60 caracteres.") }
		
		
		// NOME sem SOBRENOME
		
		guard lastname.count < 2 else { return (false, "Deve incluir um sobrenome.") }
		
		
		// SOBRENOME sem NOME
		
		guard name.count < 2 else { return (false, "Deve incluir um nome.") }
		
		
		// NOME e SOBRENOME válidos
		
		return (true, "Sucesso!")
	}
}
