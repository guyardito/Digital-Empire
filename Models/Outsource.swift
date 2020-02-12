//
//  Outsource.swift
//  Digital Empire
//
//  Created by Guy Ardito on 2/11/20.
//  Copyright © 2020 Rich Life LLC. All rights reserved.
//

import Foundation

protocol OutsourcingResource {
	
	var quality:Int { get set }
	
	var isActive:Bool { get }
}



class MarketingAgency : ObservableObject, OutsourcingResource {
	@Published var quality:Int = 0

	@Published var isActive = false
}


class SocialMediaHelp : ObservableObject, OutsourcingResource {
	@Published var quality:Int = 0
	
	@Published var isActive = false
}


class Copywriter : ObservableObject, OutsourcingResource {
	@Published var quality:Int = 0
	
	@Published var isActive = false
}




enum Outsource {
	case MarketingAgency( marketingAgency: MarketingAgency)
	case SocialMediaHelp( socialMediaHelp: SocialMediaHelp)
	case Copywriter( copywriter:Copywriter)
}


