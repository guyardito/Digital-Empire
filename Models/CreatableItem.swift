//
//  CreatableItem.swift
//  Digital Empire
//
//  Created by Guy Ardito on 2/12/20.
//  Copyright © 2020 Rich Life LLC. All rights reserved.
//

import Foundation



enum CreatableItemStatus {
	case Building
	case Ready
}



protocol CreatableItem {
	
	/*
	var status:CreatableItemStatus { get set }
	
	//var type:CreatableItemType { get set }
	
	
	var daysToCreate:Int { get set }
	
	var dayStarted:Int { get }
	//func dayStarted() -> Int
	*/
	
	
	func getStatus() -> CreatableItemStatus
	func setStatus(arg:CreatableItemStatus)
	
	func getDayStarted() -> Int
	func setDayStarted(arg:Int)
	
	func getDaysToCreate() -> Int
	func setDaysToCreate(arg:Int)
	

}

// NB!  displaying any variable which is included in the protocol causes SwiftUI to completely hang up !!!



enum CreatableItemType {
	case Ad(ad: Ad)
	case BlogPost
	case Freebie
	case Course
	case SalesPage
	case Website
	case EmailCampaign
}


//struct CreatableItem {
//	let type : CreatableItemType   // ad, blogPost, freebie, salespage, emailCampaign, course
//	let name : String
//
//	// initialize this based skills (like copywriting)
//	var timeLeftTillCreated = 0 	// in game ticks
//}


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
