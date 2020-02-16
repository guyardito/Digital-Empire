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
		
	
	func colorForStatus(status:CreatableItemStatus) -> Color {
		switch item.item.status {
			case .NotStarted:
				return .gray
			
			case .Building:
				return .orange
			
			case .Ready:
				return .black
			
			case .Active:
				return .green
			
			case .Paused:
				return .yellow
			
		}
	}
	
	
	var body: some View {
		
		let body = 	Group {
			Text("\(item.item.getName()): \(item.item.getItemType().rawValue)")
			Text("Build: \(item.item.getDayStartedCreating()) / \(item.item.getDayStartedCreating()+item.item.getDaysToCreate())")
			Text("\(item.item.status.rawValue)")
		}.frame(width:100)
		
		
		return VStack {
			/*
			// NB can't have 'switch' w/o getting error: "Closure containing control flow statement cannot be used with function builder ViewBuilder."
			
			switch item.item.status {
			case .NotStarted:
			body.foregroundColor(.gray)
			
			case .Building:
			body.foregroundColor(.orange)
			
			case .Ready:
			body.foregroundColor(.black)
			*/
			
			
			body

				
		}
		.foregroundColor(colorForStatus(status: item.item.status))
		.padding()
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
