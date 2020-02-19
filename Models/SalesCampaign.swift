//
//  Campaign.swift
//  Digital Empire
//
//  Created by Guy Ardito on 2/11/20.
//  Copyright © 2020 Rich Life LLC. All rights reserved.
//

import Foundation




class SalesCampaign : CreatableItem, Identifiable, ObservableObject {
	var uid: Int
	
	func getName() -> String {
		return name
	}
	
	func getDayStartedCreating() -> Int {
		return dayStartCreating
	}
	
	func setDayStartedCreating(arg: Int) {
		dayStartCreating = arg
	}
	
	func getDaysToCreate() -> Int {
		return daysToCreate
	}
	
	func setDaysToCreate(arg: Int) {
		daysToCreate = arg
	}
	
	func getUniqueID() -> Int {
		return id
	}
	
	func getItemType() -> CreatableItemType {
		return .SalesCampaign
	}
	
	var id:Int
	
	@Published var status: CreatableItemStatus = .NotStarted
	var statusPublished: Published<CreatableItemStatus> { _status }
	var statusPublisher: Published<CreatableItemStatus>.Publisher { $status }
	
	@Published var name:String = ""
	
	@Published var product:String = ""
	@Published var productPrice:Int = 0
	
	@Published var startDay:Int = 0
	@Published var endDay:Int = 0
	@Published var isClosed = false
	
	@Published var dayStartCreating:Int
	@Published var daysToCreate:Int
	
	
	@Published var percentWhoPurchase:Int = 0
	
	// NB this is a post-mortem number, since the user *can* change the ad spend on a DAILY basis WHILE the campaign is running
	@Published  var adSpend:Int = 0  // only relevant for new subscribers brought in
	
	@Published  var revenue:Int = 0
	@Published  var profit:Int = 0
	
	
	init(name:String, product:String, price:Int, startDay:Int, endDay:Int, percent:Int, adSpend:Int, dayStartCreating:Int, daysToCreate:Int) {
		self.id = name.hashValue
		self.uid = self.id
		
		self.name = name
		self.product = product
		self.productPrice = price
		
		self.startDay = startDay
		self.endDay = endDay
		
		self.percentWhoPurchase = percent
		
		self.adSpend = adSpend
		
		self.dayStartCreating = dayStartCreating
		self.daysToCreate = daysToCreate
	}

	
	static func computeConversionPercent(stats:Stats, productPrice:Int) -> Int {
		
		let r = ( stats.audienceCongruence * stats.audienceEngagement ) / 100
		var rv = 0
		
		
		// baseline = 30 for all relevant skills at 50
		
		// drive, creativity, tech

		return rv
	}
	

	
	
	static func computeDaysToCreate(stats:Stats) -> Int {
		var rv = 30
		
		return rv
	}
}





