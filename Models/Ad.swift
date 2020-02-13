//
//  Ad.swift
//  Digital Empire
//
//  Created by Guy Ardito on 2/11/20.
//  Copyright © 2020 Rich Life LLC. All rights reserved.
//

import Foundation





class Ad : Identifiable, ObservableObject, CreatableItem  {


	
	var id:Int
	
	@Published var status: CreatableItemStatus = .Building
	
	@Published var daysToCreate: Int = 0
	
	
	@Published var name:String
	@Published var dailySpend:Int
	@Published var clickThru:Int
	@Published var totalClicks:Int
	
	@Published var costPerClick:Float
	
	@Published var dayStarted:Int
	@Published var dayEnded:Int
	
	@Published var isClosed:Bool
	
	
	init(name:String, dailySpend:Int, clickThru:Int, totalClicks:Int, costPerClick:Float, dayStarted:Int) {
		self.id = name.hashValue
		self.name = name
		self.dailySpend = dailySpend
		self.clickThru = clickThru
		self.totalClicks = totalClicks
		self.costPerClick = costPerClick
		self.dayStarted = dayStarted
		self.dayEnded = dayStarted + 7
		
		self.isClosed = true
	}
}



func computeTimeToCreate(stats:Stats) -> Int {
	var rv = 1.0
	
	rv = Double(100) / Double(stats.tech)   +  Double(100) / Double(stats.audacity)
	
	return Int(rv)
}



func computeCostPerClick(stats:Stats) -> Float {
	
	var rv = 1.25
	
	let effectivenssFactor = Double(100) / Double(stats.copywriting)
	
	rv = rv * effectivenssFactor
	
	let random = Double.random(in: 0.7...1.3)
	
	rv = rv * random
	
	return Float(rv)
	
}



extension Ad {
	func getStatus() -> CreatableItemStatus {
		return status
	}
	
	func setStatus(arg: CreatableItemStatus) {
		status = arg
	}
	
	func getDayStarted() -> Int {
		return dayStarted
	}
	
	func setDayStarted(arg: Int) {
		dayStarted = arg
	}
	
	func getDaysToCreate() -> Int {
		return daysToCreate
	}
	
	func setDaysToCreate(arg: Int) {
		daysToCreate = arg
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



