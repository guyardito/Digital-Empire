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



protocol CreatableItem {
	
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



class CreatableItemProxy : Identifiable, ObservableObject {
	var id: Int
	
	@Published var item:CreatableItem
	
	
	init(item:CreatableItem) {
		self.item = item
		
		id = item.getName().hashValue
	}
}


// NB!  displaying any variable which is included in the protocol causes SwiftUI to completely hang up !!!








enum CreatableItemType : String {
	
	case Ad
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


func timeToCreate<CreatableItem: Identifiable>(item:CreatableItem) -> Int {
	var rv = 0
	let itemType: CreatableItemType = .Website
	
	switch itemType {
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
		
		@unknown default:
		rv = 10
	}
	
	// adjust value for 'Drive' score
	
	// adjust value for 'Efficiency' score
	
	// adust value for 'Overwhelm' score
	
	return rv
}





func costToImplement(moneyMaker:MoneyMakerType) -> Int {
	
	switch moneyMaker {
	case .Webinar: return 100
		
	case .Campaign: return 30
		
	case .LiveEvent: return 5000
	}
}
