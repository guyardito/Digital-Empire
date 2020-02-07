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

	
	// life situation
	var numberOfChildren = 0
	var hasSpouse = false
	var housingCost = 0
	var foodCost = 0

	var livingExpenses = [LivingExpense]()
	
	var marketingItems = [MarketingItem]()

	var businessExpenses = [BusinessExpenseType]()
	
	
	var specialEvents = [SpecialEvent]()


	
	
	// skills
	var copywriting = 0
	var tech = 0
	var influence = 0
	var audacity = 0
	
	
	// assets
	var money = 0
	var subscribers = 0
	var followers = 0
	
	var engagement = 0	// eg  email opening, post commenting, etc.
	
	var expensesPerDay = 0
	
}
