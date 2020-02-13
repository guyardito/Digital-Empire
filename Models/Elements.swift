//
//  Elements.swift
//  Digital Empire
//
//  Created by Guy (main) on 2/6/20.
//  Copyright © 2020 Rich Life LLC. All rights reserved.
//

import Foundation



enum MoneyMakerType {
	case Webinar
	case Campaign
	case LiveEvent
}



struct MoneyMaker {
	let type : MoneyMakerType
	
	let name : String
	
}
