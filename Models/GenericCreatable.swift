//
//  GenericCreatable.swift
//  Digital Empire
//
//  Created by Guy (main) on 2/15/20.
//  Copyright © 2020 Rich Life LLC. All rights reserved.
//

import Foundation


class GenericCreatable : CreatableItem, Identifiable {
	
	var uid: Int
	
	//@Published var status: CreatableItemStatus = .NotStarted
	@Published var status: CreatableItemStatus = .NotStarted
	var statusPublished: Published<CreatableItemStatus> { _status }
	var statusPublisher: Published<CreatableItemStatus>.Publisher { $status }

	
	
	var id:Int

	@Published var name:String
	
	@Published var itemType:CreatableItemType
	
//	@Published var dayStartRunning:Int
//	@Published var dayEnded:Int
	
	@Published var dayStartCreating:Int
	@Published var daysToCreate:Int
	
	@Published var isClosed:Bool
	
	
	init(name:String, itemType:CreatableItemType, dayStartCreating:Int, daysToCreate:Int ) {
		self.status = .NotStarted

		self.id = name.hashValue
		self.uid = self.id

		self.name = name
		
		self.itemType = itemType
		
		//self.dayStartRunning = dayStartRunning
		//self.dayEnded = dayEnded
		
		self.dayStartCreating = dayStartCreating
		self.daysToCreate = daysToCreate
		
		self.isClosed = true
		
	}
	
	
	
	func getName() -> String {
		return name
	}
	
	func getDayStartedCreating() -> Int {
		return dayStartCreating
	}
	
	func setDayStartedCreating(arg: Int) {
		dayStartCreating = arg
	}
	
	func getDaysToCreate() -> Int {
		return daysToCreate
	}
	
	func setDaysToCreate(arg: Int) {
		daysToCreate = arg
	}
	
	func getUniqueID() -> Int {
		return id
	}
	
	func getItemType() -> CreatableItemType {
		return itemType
	}
	
	
	
}
