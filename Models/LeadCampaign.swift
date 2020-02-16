//
//  LeadCampaign.swift
//  Digital Empire
//
//  Created by Guy (main) on 2/15/20.
//  Copyright © 2020 Rich Life LLC. All rights reserved.
//

import Foundation




class LeadCampaign : CreatableItem, Identifiable, ObservableObject {
	var uid: Int
	
	func getName() -> String {
		return name
	}
	
	func getDayStartedCreating() -> Int {
		return dayStartedCreating
	}
	
	func setDayStartedCreating(arg: Int) {
		dayStartedCreating = arg
	}
	
	func getDaysToCreate() -> Int {
		return endDay - dayStartedCreating
	}
	
	func setDaysToCreate(arg: Int) {
		endDay = dayStartedCreating + arg
	}
	
	func getUniqueID() -> Int {
		return id
	}
	
	func getItemType() -> CreatableItemType {
		return .LeadCampaign
	}
	
	@Published var status: CreatableItemStatus = .NotStarted
	var statusPublished: Published<CreatableItemStatus> { _status }
	var statusPublisher: Published<CreatableItemStatus>.Publisher { $status }

	
	var id:Int
	
	@Published var name:String = ""
	
	
	@Published var dayStartedCreating:Int = 0
	@Published var endDay:Int = 0
	@Published var isClosed = false
	
	
	@Published var percentWhoOptin:Int = 0
	
	// NB this is a post-mortem number, since the user *can* change the ad spend on a DAILY basis WHILE the campaign is running
	@Published  var adSpend:Int = 0  // only relevant for new subscribers brought in
	
	@Published  var revenue:Int = 0
	@Published  var profit:Int = 0
	
	
	init(name:String, product:String, price:Int, startDay:Int, endDay:Int, percent:Int, adSpend:Int) {
		self.status = .NotStarted
		self.id = name.hashValue
		self.uid = self.id
		
		self.name = name
		
		self.dayStartedCreating = startDay
		self.endDay = endDay
		
		self.percentWhoOptin = percent
		
		self.adSpend = adSpend
		
	}
}




func computePercentWhoOptin(stats:Stats) -> Int {
	
	let r = ( stats.audienceCongruence * stats.audienceEngagement ) / 100
	var rv = 0
	
	
	return rv
}

