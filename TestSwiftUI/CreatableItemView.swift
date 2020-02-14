//
//  CreatableItemView.swift
//  Digital Empire
//
//  Created by Guy Ardito on 2/13/20.
//  Copyright © 2020 Rich Life LLC. All rights reserved.
//

import SwiftUI


struct CreatableItemView: View {
	
	@ObservedObject var item:CreatableItemProxy
		
	
	var body: some View {
		
		let body = 	Group {
			Text("\(item.item.getName()), start: \(item.item.getDayStartedCreating())")
			Text("\(item.item.getDaysToCreate()) days left")
			Text("\(item.item.status.rawValue)")
		}

		
		return VStack {
			if item.item.status == .Building {
				body.foregroundColor(.gray)
			} else {
				body.foregroundColor(.black)
			}
		}
	}
}

struct CreatableItemView_Previews: PreviewProvider {
	static var ad = Ad(name: "ad 6", dailySpend: 8, clickThru: 4, totalClicks: 2391, costPerClick: 7.25, dayStartRunning: 15, dayStartCreating: 3, daysToCreate: 10)
	
    static var previews: some View {
		CreatableItemView(item: CreatableItemProxy(item:ad) )
    }
}
