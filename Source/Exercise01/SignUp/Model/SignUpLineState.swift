//
//  SignUpLineState.swift
//  Exercise01
//
//  Created by Calebe Emerick on 04/02/2018.
//  Copyright © 2018 Stone Pagamentos. All rights reserved.
//

import UIKit

enum SignUpLineState {

	case `default`
	case valid
	case invalid

	var color: UIColor {
		switch self {
		case .default:
			return Color(hexString: "#ccc").color
		case .valid:
			return Color(hexString: "#6cb94a").color
		case .invalid:
			return Color(hexString: "#ee6a64").color
		}
	}
}
