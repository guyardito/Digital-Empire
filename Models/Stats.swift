//
//  Stats.swift
//  Digital Empire
//
//  Created by Guy (main) on 2/6/20.
//  Copyright © 2020 Rich Life LLC. All rights reserved.
//

import Foundation

// NB!  need this to be a 'class' so that @Published will be accepted
class Stats : ObservableObject {
		
	@Published var powerUpPoints = 0
	
	@Published var aggregateEngagement = 0	// eg  email opening, post commenting, etc.
	@Published var audienceCongruence = 0
	
	
	@Published var gameTimeInDays = 5

	// skills
	@Published var copywriting = 20
	@Published var tech = 23
	@Published var influence = 26
	@Published var audacity = 29
	
	// the higher the overwhelm the slower a task takes to do
	// the higher the overwhelm the lower the impact of your influence, tech, etc.
	@Published var overwhelm = 0
	
	// assets
	@Published var money = 0
	@Published var subscribers = 0
	@Published var followers = 0
	
	@Published var showOutsourcers = false
	
	
	
	@Published var livingExpenses = [LivingExpense]()


	@Published var createdItems = [CreatableItem]()
	@Published var moneyMakers = [MoneyMaker]()

	@Published var ads = [Ad]()
	@Published var campaigns = [Campaign]()
	
	@Published var marketingItems = [MarketingItem]()

	
	//var businessExpenses = [BusinessExpenseType]()
	
	
	@Published var specialEvents = [SpecialEvent]()


	func marketingElements() -> [MarketingElement] {
		
		var rv = [MarketingElement]()
		
		for ad in ads {
			rv.append( .Ad(ad: ad) )
		}
		
		for campaign in campaigns {
			rv.append( .Campaign(campaign: campaign) )
		}
		
		return rv
	}
	
	
}
