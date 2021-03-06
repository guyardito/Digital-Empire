//
//  Ad.swift
//  Digital Empire
//
//  Created by Guy Ardito on 2/11/20.
//  Copyright © 2020 Rich Life LLC. All rights reserved.
//

import Foundation





class Ad : Identifiable, ObservableObject, CreatableItem  {
	var uid: Int

	
	func getItemType() -> CreatableItemType {
		return .Ad
	}
	

	//@Published var status: CreatableItemStatus = .NotStarted
	@Published var status: CreatableItemStatus = .NotStarted
	var statusPublished: Published<CreatableItemStatus> { _status }
	var statusPublisher: Published<CreatableItemStatus>.Publisher { $status }
	

		
	
	@Published var name:String
	@Published var dailySpend:Int
	@Published var clickThru:Int
	@Published var totalClicks:Int
	
	@Published var costPerClick:Float
	
	@Published var dayStartRunning:Int
	@Published var dayEnded:Int
	
	@Published var dayStartCreating:Int
	@Published var daysToCreate:Int
	
	@Published var isClosed:Bool
	
	
	init(name:String, dailySpend:Int, clickThru:Int, totalClicks:Int, costPerClick:Float, dayStartRunning:Int, dayStartCreating:Int, daysToCreate:Int ) {
		//self.id = name.hashValue
		self.uid = name.hashValue
		self.name = name
		self.dailySpend = dailySpend
		self.clickThru = clickThru
		self.totalClicks = totalClicks
		self.costPerClick = costPerClick
		
		self.dayStartRunning = dayStartRunning
		self.dayEnded = dayStartRunning + 7

		self.dayStartCreating = dayStartCreating
		self.daysToCreate = daysToCreate
		
//		if daysToCreate == 0 {
//			status = .Ready
//		} else {
//			status = .Building
//		}
		
		self.isClosed = true
	}
	
}



func computeDaysToCreate(stats:Stats) -> Int {
	var rv = 1.0
	
	rv = 300.0 / Double(stats.precision + stats.drive + stats.creativity)
	
	guard rv <= 10 else {
		return 10
	}
	
	// NB  'charm' will be used to compute the effectiveness
	
	
	return Int(rv)
}



func computeCostPerClick(stats:Stats) -> Float {
	
	var rv = 1.25
	
	let effectivenssFactor = Double(100) / Double(stats.charm)
	
	rv = rv * effectivenssFactor
	
	let random = Double.random(in: 0.7...1.3)
	
	rv = rv * random
	
	return Float(rv)
	
}



extension Ad {
	
	func getUniqueID() -> Int {
		return uid
	}
	
	
	func getName() -> String {
		return name
	}
	
	
	func getStatus() -> CreatableItemStatus {
		return status
	}
	
	
	func setStatus(arg: CreatableItemStatus) {
		status = arg
	}
	
	
	func getDayStartedCreating() -> Int {
		return dayStartCreating
	}
	
	
	func setDayStartedCreating(arg: Int) {
		guard arg >= 0 else { return }
		
		dayStartCreating = arg
	}
	
	
	func getDaysToCreate() -> Int {
		return daysToCreate
	}
	
	
	func setDaysToCreate(arg: Int) {
		guard arg >= 0 else { return }
		
		daysToCreate = arg
		if daysToCreate == 0 {
			status = .Ready
		}
	}
}



/*
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
*/



