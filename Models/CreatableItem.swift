//
//  CreatableItem.swift
//  Digital Empire
//
//  Created by Guy Ardito on 2/12/20.
//  Copyright © 2020 Rich Life LLC. All rights reserved.
//

import Foundation



enum CreatableItemStatus : String {
	case NotStarted
	case Building
	case Ready
	case Active
	case Paused
}





enum CreatableItemType : String {
	
	case LeadCampaign
	case SalesCampaign
	
	case Ad
	case BlogPost
	case Freebie
	case Course
	case SalesPage
	case Website
	case EmailCampaign
}




protocol CreatableItem {
	
	var uid: Int { get set  }

	func getName() -> String
	
	func getDayStartedCreating() -> Int
	func setDayStartedCreating(arg:Int)
	
	func getDaysToCreate() -> Int
	func setDaysToCreate(arg:Int)
	
	func getUniqueID() -> Int
	
	func getItemType() -> CreatableItemType
	
	var status: CreatableItemStatus { get set }
	var statusPublished: Published<CreatableItemStatus> { get  }
	var statusPublisher: Published<CreatableItemStatus>.Publisher { get  }
}




class CreatableItemProxy : Identifiable, ObservableObject { //}, CreatableItem {

	var uid: Int = 0
	
	@Published var item:CreatableItem

	func getID() -> Int {
		return uid
	}
	
	
	init(item:CreatableItem) {
		self.item = item
	
		uid = item.getName().hashValue
	}
	
	
	
	
	func getName() -> String {
		return self.item.getName()
	}
	
	func getDayStartedCreating() -> Int {
		return self.item.getDayStartedCreating()
	}
	
	func setDayStartedCreating(arg: Int) {
		self.item.setDayStartedCreating(arg: arg)
	}
	
	func getDaysToCreate() -> Int {
		return self.item.getDaysToCreate()
	}
	
	func setDaysToCreate(arg: Int) {
		self.item.setDaysToCreate(arg: arg)
	}
	
	func getUniqueID() -> Int {
		return self.item.getUniqueID()
	}
	
	func getItemType() -> CreatableItemType {
		return self.item.getItemType()
	}
	
}


// NB!  displaying any variable which is included in the protocol causes SwiftUI to completely hang up !!!







//struct CreatableItem {
//	let type : CreatableItemType   // ad, blogPost, freebie, salespage, emailCampaign, course
//	let name : String
//
//	// initialize this based skills (like copywriting)
//	var timeLeftTillCreated = 0 	// in game ticks
//}


func daysToCreate(item:CreatableItem, stats:Stats) -> Int {
	var rv = 0
	let itemType: CreatableItemType = item.getItemType()
	
	switch itemType {
		case .LeadCampaign:
		rv = 30
		
		case .SalesCampaign:
		rv = 60
		
		case .Ad:
		rv = 5
		
		case .BlogPost:
		rv = 2
		
		case .Freebie:
		rv = 5
		
		case .Course:
		rv = 60
		
		case .SalesPage:
		rv = 20
		
		case .Website:
		rv = 30
		
		case .EmailCampaign:
		rv = 45

	}
	
	// adjust value for 'Drive' score
	
	// adjust value for 'Efficiency' score
	
	// adust value for 'Overwhelm' score
	
	return rv
}





func costToCreate(moneyMaker:MoneyMakerType) -> Int {
	
	switch moneyMaker {
	case .Webinar: return 100
		
	case .Campaign: return 30
		
	case .LiveEvent: return 5000
	}
}
