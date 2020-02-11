//
//  Elements.swift
//  Digital Empire
//
//  Created by Guy (main) on 2/6/20.
//  Copyright © 2020 Rich Life LLC. All rights reserved.
//

import Foundation





class AdData : Identifiable, ObservableObject {
	var id:Int
	
	@Published var name:String
	@Published var dailySpend:Int
	@Published var clickThru:Int
	@Published var totalClicks:Int
	
	@Published var costPerClick:Float
	
	
	init(name:String, dailySpend:Int, clickThru:Int, totalClicks:Int, costPerClick:Float) {
		self.id = name.hashValue
		self.name = name
		self.dailySpend = dailySpend
		self.clickThru = clickThru
		self.totalClicks = totalClicks
		self.costPerClick = costPerClick
	}
}



func computeCostPerClick(stats:Stats) -> Double {
	//let = stat.numberOfAdsCreated
	
	let cw = stats.copywriting
	
	var cost = 0.0
	switch stats.copywriting {
		case 0..<10:
			cost = 15.0
		
		case 10..<20:
			cost = 12.0
		
		case 20..<30:
			cost = 10.0
		
		case 30..<40:
			cost = 8.0
		
		case 40..<50:
			cost = 6.0
		
		case 50..<60:
			cost = 4.0
		
		case 60..<70:
			cost = 3.0
		
		case 70..<80:
			cost = 2.0
		
		case 80..<90:
			cost = 1.75
		
		case 90..<100:
			cost = 1.25
		
		default:
			cost = 1.25
		
	}
	
	// now add a random element
	let r = Double.random(in: 0.7...1.6)
	cost *= r
	
	return cost
}





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
