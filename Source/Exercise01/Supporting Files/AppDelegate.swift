//
//  AppDelegate.swift
//  Exercise01
//
//  Created by Calebe Emerick on 01/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate : UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		
		let window = UIWindow(frame: UIScreen.main.bounds)
		
		let rootController = SignUpController(title: "Novo Cadastro")
		let navigation = UINavigationController(rootViewController: rootController)
		
		window.rootViewController = navigation
		window.makeKeyAndVisible()
		
		self.window = window
		
		return true
	}
}
