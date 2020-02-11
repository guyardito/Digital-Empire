//
//  Campaign.swift
//  Digital Empire
//
//  Created by Guy Ardito on 2/11/20.
//  Copyright © 2020 Rich Life LLC. All rights reserved.
//

import Foundation




class Campaign : Identifiable, ObservableObject {
	var id:Int

	@Published var name:String = ""
	
	@Published var product:String = ""
	@Published var productPrice:Int = 0
	
	@Published var startDay:Int = 0
	@Published var endDay:Int = 0
	
	
	@Published var percentWhoPurchase:Int = 0
	
	// NB this is a post-mortem number, since the user *can* change the ad spend on a DAILY basis WHILE the campaign is running
	@Published  var adSpend:Int = 0  // only relevant for new subscribers brought in
	
	@Published  var revenue:Int = 0
	@Published  var profit:Int = 0
	
	
	init(name:String, product:String, price:Int, startDay:Int, endDay:Int, percent:Int, adSpend:Int) {
		self.id = name.hashValue

		self.name = name
		self.product = product
		self.productPrice = price
		
		self.startDay = startDay
		self.endDay = endDay
		
		self.percentWhoPurchase = percent
		
		self.adSpend = adSpend
	}
}




func computePercentWhoPurchase(stats:Stats, productPrice:Int) -> Int {
	
	let r = ( stats.audienceCongruence * stats.aggregateEngagement ) / 100
	var rv = 0
	
	
	return rv
}


