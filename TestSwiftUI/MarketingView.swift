//
//  MarketingView.swift
//  Digital Empire
//
//  Created by Guy (main) on 2/8/20.
//  Copyright © 2020 Rich Life LLC. All rights reserved.
//

import SwiftUI
import CoreGraphics

struct MarketingView: View {
	
	@State var sliderValue = 20.0

	
	var body: some View {
		
		HStack {
			Spacer(minLength: CGFloat(40))
			HStack {
				VStack {
					Text("Ad 1")
					Text("3% click-thru")
					Text("Total Clicks: 4391")
					Slider(value: $sliderValue)
				}
				Spacer(minLength: CGFloat(40.0))
			}
			VStack {
				Spacer()
				Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
					Text("Pause")
				}.buttonStyle(DefaultButtonStyle())
				Spacer()
				Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
					Text("Cancel")
				}.buttonStyle(DefaultButtonStyle())
				Spacer()
			}
			
		}
	}
}

struct MarketingView_Previews: PreviewProvider {
    static var previews: some View {
        MarketingView()
    }
}
