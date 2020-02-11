//
//  MarketingView.swift
//  Digital Empire
//
//  Created by Guy (main) on 2/8/20.
//  Copyright © 2020 Rich Life LLC. All rights reserved.
//

import SwiftUI
import CoreGraphics




struct AdView: View {
	
	@State var isClosed = false

	@ObservedObject var data:Ad

	
	var body: some View {
		
		let mainView = HStack {
			HStack {
				VStack {
					HStack {
						Text("\(self.data.name): ")
						Text("started: \(self.data.dayStarted)")
						Text("daily: $\(self.data.dailySpend)")
					}
					Text("\(self.data.clickThru)% click-thru  Total: \(self.data.totalClicks)")
					//Text("Total Clicks: \(self.data.totalClicks)")
					//Slider(value: $sliderValue)
				}
				Spacer(minLength: CGFloat(40.0))
			}
			VStack {
				Spacer()
				Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
					Text("Pause")
				}.buttonStyle(DefaultButtonStyle())
//				Spacer()
//				Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
//					Text("Cancel")
//				}.buttonStyle(DefaultButtonStyle())
				Spacer()
			}
			
		}
		
		return HStack {
			Spacer(minLength: CGFloat(40))
			
			if data.isClosed {
				mainView.foregroundColor(.gray)
				
			} else {
				mainView
				
			}
		}
	}
}

struct AdView_Previews: PreviewProvider {
    static var previews: some View {
		AdView( data: Ad(name: "ad 6", dailySpend: 8, clickThru: 4, totalClicks: 2391, costPerClick: 7.25, dayStarted: 15))
    }
}
