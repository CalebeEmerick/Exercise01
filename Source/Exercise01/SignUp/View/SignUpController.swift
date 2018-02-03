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
	
	init(title: String) {
		rootView = SignUpControllerView.makeXib()
		
		super.init(nibName: nil, bundle: nil)
		
		self.title = title
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		view = rootView
	}
}
