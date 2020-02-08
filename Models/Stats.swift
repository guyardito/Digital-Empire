//
//  Stats.swift
//  Digital Empire
//
//  Created by Guy (main) on 2/6/20.
//  Copyright © 2020 Rich Life LLC. All rights reserved.
//

import Foundation


struct Stats {
		
	var gameTimeInDays = 0

	// skills
	var copywriting = 0
	var tech = 0
	var influence = 0
	var audacity = 0
	
	
	// assets
	var money = 0
	var subscribers = 0
	var followers = 0
	
	var aggregateEngagement = 0	// eg  email opening, post commenting, etc.
	
	
	
	var livingExpenses = [LivingExpense]()


	var createdItems = [CreatableItem]()
	var moneyMakers = [MoneyMaker]()

	
	var marketingItems = [MarketingItem]()

	
	//var businessExpenses = [BusinessExpenseType]()
	
	
	var specialEvents = [SpecialEvent]()


	
	
}
