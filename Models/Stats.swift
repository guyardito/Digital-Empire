//
//  Stats.swift
//  Digital Empire
//
//  Created by Guy (main) on 2/6/20.
//  Copyright © 2020 Rich Life LLC. All rights reserved.
//

import Foundation

// NB!  need this to be a 'class' so that @Published will be accepted
class Stats {
		
	@Published var gameTimeInDays = 0

	// skills
	@Published var copywriting = 0
	@Published var tech = 0
	@Published var influence = 0
	@Published var audacity = 0
	
	// the higher the overwhelm the slower a task takes to do
	// the higher the overwhelm the lower the impact of your influence, tech, etc.
	@Published var overwhelm = 0
	
	// assets
	@Published var money = 0
	@Published var subscribers = 0
	@Published var followers = 0
	
	@Published var aggregateEngagement = 0	// eg  email opening, post commenting, etc.
	
	
	
	@Published var livingExpenses = [LivingExpense]()


	@Published var createdItems = [CreatableItem]()
	@Published var moneyMakers = [MoneyMaker]()

	@Published var ads = [AdData]()
	@Published var marketingItems = [MarketingItem]()

	
	//var businessExpenses = [BusinessExpenseType]()
	
	
	@Published var specialEvents = [SpecialEvent]()


	
	
}
