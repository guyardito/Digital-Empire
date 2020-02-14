//
//  CreatableItemList.swift
//  Digital Empire
//
//  Created by Guy Ardito on 2/13/20.
//  Copyright © 2020 Rich Life LLC. All rights reserved.
//

import SwiftUI

struct CreatableItemList: View {
	
	//@EnvironmentObject var game:GameCoordinator
	@ObservedObject var stats:Stats  // NB need this declaration to recognize changes to the array
	
	var body: some View {
		ScrollView(.horizontal)  {
			ZStack {
			Color.yellow
			HStack {
				// multiple status view here

				ForEach(stats.creatableItems) { item in
					CreatableItemView(item: item)
				}
				.padding(.horizontal, 15)
			}
			}
		}.frame(height: 80)
		
	}
}


struct CreatableItemList_Previews: PreviewProvider {
	
	static let stats = getTestUserData()
	
	static let ads = [
		CreatableItemProxy( item: Ad(name: "ad 1", dailySpend: 5, clickThru: 4, totalClicks: 2391, costPerClick: 3.25, dayStartRunning: 5, dayStartCreating:2, daysToCreate: 3) ),
		CreatableItemProxy( item: Ad(name: "ad 2", dailySpend: 3, clickThru: 8, totalClicks: 430, costPerClick: 4.20, dayStartRunning: 20, dayStartCreating: 13, daysToCreate: 2) ),
		CreatableItemProxy( item: Ad(name: "ad 2", dailySpend: 3, clickThru: 8, totalClicks: 430, costPerClick: 4.20, dayStartRunning: 20, dayStartCreating: 13, daysToCreate: 2) ),
		CreatableItemProxy( item: Ad(name: "ad 2", dailySpend: 3, clickThru: 8, totalClicks: 430, costPerClick: 4.20, dayStartRunning: 20, dayStartCreating: 13, daysToCreate: 2) ),
		CreatableItemProxy( item: Ad(name: "ad 3", dailySpend: 7, clickThru: 2, totalClicks: 3096, costPerClick: 1.75, dayStartRunning: 30, dayStartCreating: 22, daysToCreate: 1) )
		
	]

    static var previews: some View {
		//CreatableItemList(items:ads)
		CreatableItemList(stats:stats)
    }
}