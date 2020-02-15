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
			Text("\(item.item.getName())")
			Text("Build: \(item.item.getDayStartedCreating()) / \(item.item.getDayStartedCreating()+item.item.getDaysToCreate())")
			Text("\(item.item.status.rawValue)")
		}.frame(width:100)

		
		return VStack {
//			switch item.item.status {
//			case .NotStarted:
//				body.foregroundColor(.gray)
//
//			case .Building:
//				body.foregroundColor(.orange)
//
//			case .Ready:
//				body.foregroundColor(.black)
//
			if item.item.status == .Waiting { body.foregroundColor(.gray) }
					
			else if item.item.status == .Building { body.foregroundColor(.orange) }
					
			else { body.foregroundColor(.black) }
			}.padding()
			//.border(Color.purple, width:5) .cornerRadius(15.0)
			.overlay(
				RoundedRectangle(cornerRadius: 20)
					.stroke(Color.purple, lineWidth: 5)
		)

		
	}
}

struct CreatableItemView_Previews: PreviewProvider {
	static var ad = Ad(name: "ad 6", dailySpend: 8, clickThru: 4, totalClicks: 2391, costPerClick: 7.25, dayStartRunning: 15, dayStartCreating: 3, daysToCreate: 10)
	
    static var previews: some View {
		CreatableItemView(item: CreatableItemProxy(item:ad) )
    }
}
