//
//  UserData.swift
//  Digital Empire
//
//  Created by Guy (main) on 2/8/20.
//  Copyright © 2020 Rich Life LLC. All rights reserved.
//

import Foundation
import Combine

///Last I recall, BindableObject was renamed to ObservableObject and @ObjectBinding is now @ObservedObject. Additionally, in an ObservableObject you no longer need to implement didChange yourself, you just use the @Published attribute on any properties you want to publish and the rest will be taken care of for you.

final class UserData : ObservableObject {
	
	// PassthroughSubject is publisher from Combine framework; it immediately passes any values to its subscribers.
	// SwiftUI subscribes to your object through this publisher and updates any views that need refreshing when data changes
	let changePublisher = PassthroughSubject<UserData, Never>() // return 'UserData' instance, and 'Never' throw an error
	
	
	// when property value changes make sure to publish it!  Use 'didSet'

	var stats = Stats() {
		didSet {
			changePublisher.send(self)
		}
	}
}




func getTestUserData() -> Stats {
	
	let stats = Stats()
	
	let ads = [
		AdData(name: "ad 1", dailySpend: 5, clickThru: 4, totalClicks: 2391, costPerClick: 3.25),
		AdData(name: "ad 2", dailySpend: 3, clickThru: 8, totalClicks: 430, costPerClick: 4.20),
		AdData(name: "ad 3", dailySpend: 7, clickThru: 2, totalClicks: 3096, costPerClick: 1.75)
		
	]
	
	stats.ads = ads
	
	stats.money = 50000
	
	
	stats.livingExpenses = [
		LivingExpense(type: .Housing, monthlyExpense: 3000),
		LivingExpense(type: .Food, monthlyExpense: 800),
		LivingExpense(type: .Car, monthlyExpense: 275),
		LivingExpense(type: .ChildCare, monthlyExpense: 1000),
		LivingExpense(type: .Utilities, monthlyExpense: 450)
	]
	

	
	return stats
}


