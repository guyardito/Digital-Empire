//
//  Expenses.swift
//  Digital Empire
//
//  Created by Guy (main) on 2/6/20.
//  Copyright © 2020 Rich Life LLC. All rights reserved.
//

import Foundation

/*
struct Expense {
	enum frequency {
		case Weekly
		case Monthly
	}
	
	var type : ExpenseType
	
	var amount = 0
}
*/





// treat these as monthly
enum LivingExpenseType {
	case ChildCare
	case Housing
	case Food
	case Car
	case Utilities
}



struct LivingExpense {
	let type:LivingExpenseType
	
	var monthlyExpense:Int
}




enum MarketingItemType {
	
	case Ad(effectiveness:Int)  // affected by copywriting
	case AdRun(dailySpend:Int) // affected by technology
	
	case Post(effectiveness:Int)  // affected by influence
	case PostBoost(dailySpend:Int)
	
	case emailCampaign(effectivenss:Int) // affected by copywriting, engagement
}



struct MarketingItem {
	
	let type:MarketingItemType
	
	var timeLeftToCreate:Int   // in game ticks (which is likely days)
	
	var dailyExpense:Int
	
	
	func process(stats:Stats) {
		switch type {
			case .Ad:
				print("ad")
			
			case .AdRun:
				print("run")
			// process clicks + optins
			
			case .Post:
				print("post")
			
			case .PostBoost:
				print("boost")
			
			case .emailCampaign:
				print("campaign")
		}
	}
}



// treat these as weekly
enum BusinessExpenseType {
	
	case RunAd
	case BoostPost
	case CourseHostingSoftware
	case AttendConference

}









func defaultMonthlyAmountFor(expense:LivingExpenseType) -> Int {
	
	switch expense {
		case .ChildCare: return 1000
		case .Housing: return 2500
		case .Food: return 300
		case .Car: return 300
		case .Utilities: return 275
	}
}



func defaultDailyAmountFor(expense:MarketingItemType) -> Int {
	
	switch expense {
		case .Ad : return 0
		case .AdRun: return 25
		
		case .Post: return 0
		case .PostBoost: return 2
		//case .CourseHostingSoftware: return 5
		//case .AttendConference: return 3000
		case .emailCampaign: return 0
	}
}

