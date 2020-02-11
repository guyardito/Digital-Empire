//
//  GameCoordinator.swift
//  Digital Empire
//
//  Created by Guy (main) on 2/6/20.
//  Copyright © 2020 Rich Life LLC. All rights reserved.
//

import Foundation



// NB this is a 'class' so that the callbacks from the timer can easily mutate the object

class GameCoordinator : ObservableObject {
		
	var history = [Event]()
		
	
	var gameShouldEndOnNextTick = false
	
	let maxDaysToPlay = 365
	let minAmountToMake = 1000000
	
	var stats = Stats()
	
	var timer : Timer?
	
	

	init() {
		
	}
	
	
	init(stats:Stats) {
		self.stats = stats
		
		startGame(stats: self.stats)
	}
	
	
	
	func startGame(stats:Stats) {
		self.stats = stats
		
		gameShouldEndOnNextTick = false
		
		// start event timer, callbac, to processTick
		
		timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(processTimerTick), userInfo: nil, repeats: true)
		

	}
	
	
	
	
	@objc func processTimerTick() {
		
		//decrement timeLeft for any current tasks
		
		
		processItemCreation()
		
		processDailyExpenses()
		
		if stats.gameTimeInDays % 30 == 0 {
			processMonthlyExpenses()
		}
		
		processLeadGeneration()
		
		
		// will there be a "chance card"
		processChanceCard()
		
		processIncomeGenerators()  // can create RewardEvents
		
		processSpecialRewards()
		
		processClosures()
		
		stats.gameTimeInDays += 1
	}
	
	
	func processItemCreation() {
		for (idx, item) in stats.createdItems.enumerated() {
			stats.createdItems[idx].timeLeftTillCreated -= 1
			
		}
	}
	
	
	func processDailyExpenses() {
		// add spends
		
		// post boosts
		
		for item in stats.marketingItems {
			let e = item.dailyExpense
			
			stats.money -= e
		}
		
		for ad in stats.ads {
			stats.money -= ad.dailySpend
		}

	}
	
	
	
	func processMonthlyExpenses() {
		// rent, food
		
		// child expenses
		
		// email, website hosting, etc
		
		for item in stats.livingExpenses {
			let e = item.monthlyExpense
			
			stats.money -= e
		}
	}
	
	
	func processClosures() {
		for ad in stats.ads {
			if ad.dayEnded < stats.gameTimeInDays {
				ad.isClosed = true
			}
		}
		
		for campaign in stats.campaigns {
			if campaign.endDay < stats.gameTimeInDays {
				campaign.isClosed = true
			}
		}
	}
	
	
	
	func processLeadGeneration() {
		for i in 0..<stats.ads.count {
			if stats.ads[i].isClosed == false {
				let v = Int.random(in: 0 ... 10)
				stats.ads[i].totalClicks += v
				
				stats.subscribers += Int(Double(v) * 0.3)
			}
		}
	}
	
	
	func processChanceCard() {
		// see if a chance should be played
		
		// if so, select and remove from deck
		
		// present to user
		
		// slow-down game for a few beats so that user can react
		
		// if appropriate, process their choice/result
		
		// if approriate, present consequence of their choice
	}
	
	
	
	func processIncomeGenerators() {  // can generate SpecialEvents
		// ads, posts, etc
		
		// add subscribers
		
		// income from purchased products / services
		
		for i in stats.moneyMakers {
			let income = 10 // ???
			
			stats.money += income
		}
	}
	
	
	
	func processUserEvent(event: Event) {
		// create something
		
		// learn something
		
		// advertise
		
		// boost a post
	}
	
	
	
	
	func processSpecialRewards() {
		
	}
	
	
	
	func isGameOver() -> Bool {
		
		if stats.gameTimeInDays >= maxDaysToPlay { return true }
		
		if stats.money >= minAmountToMake { return true }
		
		return gameShouldEndOnNextTick
	}
	
	
	

}
