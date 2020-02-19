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
	
	@Published var audienceEngagement = 0	// eg  email opening, post commenting, etc.
	@Published var audienceCongruence = 30
	
	
	@Published var gameTimeInDays = 1

	// skills
	@Published var charm = 20  // copywriting  
	@Published var precision = 23   // compliance   tech
	//@Published var influence = 26  // influence
	@Published var drive = 29  // drive
	@Published var creativity = 28
	
	
	
	// the higher the overwhelm the slower a task takes to do
	// the higher the overwhelm the lower the impact of your influence, tech, etc.
	@Published var overwhelm = 0
	
	// assets
	@Published var money = 0
	@Published var subscribers = 0
	@Published var followers = 0
	
	@Published var showOutsourcers = false
	
	
	
	@Published var livingExpenses = [LivingExpense]()


	@Published var moneyMakers = [MoneyMaker]()

	@Published var genericCreatables = [GenericCreatable]()
	@Published var activeCreatableItemProxies = [CreatableItemProxy]()
	@Published var inactiveCreatableItemProxies = [CreatableItemProxy]()
	@Published var ads = [Ad]()
	@Published var leadCampaigns = [LeadCampaign]()
	@Published var salesCampaigns = [SalesCampaign]()
	
	@Published var marketingItems = [MarketingItem]()

	
	//var businessExpenses = [BusinessExpenseType]()
	
	
	@Published var specialEvents = [SpecialEvent]()

	 init() {
	}
	
	
	func marketingElements() -> [MarketingElement] {
		
		var rv = [MarketingElement]()
		
		for ad in ads {
			rv.append( .Ad(ad: ad) )
		}
		
		for campaign in salesCampaigns {
			rv.append( .Campaign(campaign: campaign) )
		}
		
		return rv
	}
	
	
}
