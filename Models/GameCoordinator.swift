//
//  GameCoordinator.swift
//  Digital Empire
//
//  Created by Guy (main) on 2/6/20.
//  Copyright © 2020 Rich Life LLC. All rights reserved.
//

import Foundation


enum AttributeType {
	case Drive
	case Vision
	case Organization
	case Influence
}


// NB this is a 'class' so that the callbacks from the timer can easily mutate the object

class GameCoordinator : ObservableObject {
		
	var history = [Event]()
		
	
	var gameShouldEndOnNextTick = false
	
	let maxDaysToPlay = 365
	let minAmountToMake = 1000000
	
	var stats : Stats = Stats()
	
	var timer : Timer?
	
	

	init() {
	}
	
	
	// this constructor is specifically for ContentView_Previews for the GameView
	init(stats:Stats) {
		self.stats = stats
		self.stats.overwhelm = 50
		//startGame(stats: self.stats)
	}
	
	
	
	
	func startGame(stats:Stats) {
		self.stats = stats
		self.stats.overwhelm = 100

		gameShouldEndOnNextTick = false
		
		// start event timer, callbac, to processTick
		DispatchQueue.main.async {

			self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
				self!.processTimerTick()
			}
		}

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
		
		for (idx, item) in stats.creatableItemProxies.enumerated() {
			if item.item.getDayStartedCreating() == stats.gameTimeInDays {
				stats.creatableItemProxies[idx].item.status = .Building
				
			} else if /* stats.gameTimeInDays >= item.item.getDayStartedCreating()  && */  ( item.item.getDayStartedCreating() + item.item.getDaysToCreate()) == stats.gameTimeInDays {
				//stats.creatableItems[idx].item.setStatus(arg: .Ready)
				stats.creatableItemProxies[idx].item.status = .Ready
				
			}
			
			
		}

		//			}
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
			if stats.gameTimeInDays >= ad.dayStartRunning   &&  stats.gameTimeInDays <= ad.dayEnded  {
				ad.isClosed = false
			} else {
				ad.isClosed = true
			}
		}
		
		for campaign in stats.salesCampaigns {
			if stats.gameTimeInDays >= campaign.startDay  &&  stats.gameTimeInDays <= campaign.endDay  {
				campaign.isClosed = false
			} else {
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
	
	
	
	
	func createAd() {
		let name = "ad_\(stats.ads.count+1)"
		
		let costPerClick = computeCostPerClick(stats: stats)
		
		let timeToImplement = computeDaysToCreate(stats: stats)
		
		let startDay = stats.gameTimeInDays + timeToImplement
		
		let ad = Ad(name: name, dailySpend: 5, clickThru: 0, totalClicks: 0, costPerClick: costPerClick, dayStartRunning: startDay, dayStartCreating: 15, daysToCreate: 3)
		
		stats.ads.insert(ad, at: 0)
		
		let e = CreatableItemProxy(item: ad)
		stats.creatableItemProxies.append(e)
		
		print("\(stats.ads.count) ads,  \(stats.creatableItemProxies.count) creatables")
	}
	
	
	
	func createLeadCampaign() {
		print("create lead campaign")
	}
	
	
	
	func adjustBranding() {
		print("adjust branding")
	}

	
	func createSalesCampaign() {
		print("create sales campaign")
	}
	
	
	/*
	func createLeadMagnet() {
		
	}
	*/

	/*
	func createSalesPage() {
		
	}
	*/
	
	/*
	func createSalesCampaign() {
		
	}
	
	

	func createCampaign() {
		
	}
	
	func createWebsite() {
		
	}
	
	
	func createLandingPage() {
		
	}
	
	
	func createProduct() {
		
	}
	*/
	
	func postSocialMedia() {
		print("post social media")
	}
	
	func postEmail() {
		print("post email")
	}
	
	func postBlog() {
		print("post blog")
	}
	
	
	
	func playChanceCard() {
		
	}
	
	
	func powerUp(_ attribute:AttributeType) {
		
	}

}
