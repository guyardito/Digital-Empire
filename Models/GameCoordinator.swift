//
//  GameCoordinator.swift
//  Digital Empire
//
//  Created by Guy (main) on 2/6/20.
//  Copyright © 2020 Rich Life LLC. All rights reserved.
//

import Foundation



// NB this is a 'class' so that the callbacks from the timer can easily mutate the object

class GameCoordinator {
	
	var gameShouldEndOnNextTick = false
	
	let maxDaysToPlay = 365
	let minAmountToMake = 1000000
	
	var stats = Stats()
	
	
	init() {
		// start event timer, callbac, to processTick
		
		_ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(processTimerTick), userInfo: nil, repeats: true)

	}
	
	
	
	@objc func processTimerTick() {
		
		//decrement timeLeft for any current tasks
		
		processDailyExpenses()
		
		if stats.gameTimeInDays % 30 == 0 {
			processMonthlyExpenses()
		}
		
		
		// will there be a "chance card"
		processChanceCard()
		
		stats.gameTimeInDays += 1
	}
	
	
	
	func processChanceCard() {
		
	}
	
	
	
	func processUserEvent(event: Event) {
		
	}
	
	
	func isGameOver() -> Bool {
		
		if stats.gameTimeInDays >= maxDaysToPlay { return true }
		
		if stats.money >= minAmountToMake { return true }
		
		return gameShouldEndOnNextTick
	}
	
	
	
	func processDailyExpenses() {
		// add spends
		
		// post boosts
	}
	
	
	
	func processMonthlyExpenses() {
		// rent, food
		
		// child expenses
		
		// email, website hosting, etc
		
	}
	

}
