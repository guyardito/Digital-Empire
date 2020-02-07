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


func defaultMonthlyAmountFor(expense:LivingExpenseType) -> Int {
	
	switch expense {
		case .ChildCare: return 1000
		case .Housing: return 2500
		case .Food: return 300
		case .Car: return 300
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
	}
}




// treat these as monthly
enum LivingExpenseType {
	case ChildCare
	case Housing
	case Food
	case Car
}



struct LivingExpense {
	let type:LivingExpenseType
	
	var monthlyExpense:Int
}







enum MarketingItemType {
	case Ad
	case AdRun
	case Post
	case PostBoost
}



struct MarketingItem {
	
	let type:MarketingItemType
	
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


