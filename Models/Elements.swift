//
//  Elements.swift
//  Digital Empire
//
//  Created by Guy (main) on 2/6/20.
//  Copyright © 2020 Rich Life LLC. All rights reserved.
//

import Foundation



enum CreatableItemType {
	case Ad
	case BlogPost
	case Freebie
	case Course
	case SalesPage
	case Website
	case EmailCampaign
}


struct CreatableItem {
	let type : CreatableItemType   // ad, blogPost, freebie, salespage, emailCampaign, course
	let name : String
	
	// initialize this based skills (like copywriting)
	var timeLeftTillCreated = 0 	// in game ticks
}


func timeToCreate(item:CreatableItem) -> Int {
	
	return 0
}





func costToImplement(moneyMaker:MoneyMakerType) -> Int {
	
	switch moneyMaker {
		case .Webinar: return 100
		
		case .Campaign: return 30
		
		case .LiveEvent: return 5000
	}
}


enum MoneyMakerType {
	case Webinar
	case Campaign
	case LiveEvent
}



struct MoneyMaker {
	let type : MoneyMakerType
	
	let name : String
	
}
