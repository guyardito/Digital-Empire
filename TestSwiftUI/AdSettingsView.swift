//
//  AdSettingsView.swift
//  Digital Empire
//
//  Created by Guy Ardito on 2/14/20.
//  Copyright © 2020 Rich Life LLC. All rights reserved.
//

import SwiftUI

//struct AdSettingsView: View {
//	@ObservedObject var ad : Ad
//
//	var body: some View {
//		VStack {
//			Text("\(ad.name)")
//			Text("Start running on day: \(ad.dayStartRunning)")
//			Text("Spend per day: \(ad.dailySpend)")
//		}
//	}
//}




//struct AdSettingsView<Content>: View where Content: View {
struct AdSettingsView : View {
	
	@State var isPresented = false
	
	
	
	//@Binding var isShowing: Bool
	//var content: () -> Content
	@ObservedObject var ad: Ad
	
	
	var body: some View {
		Button(action: {
			self.isPresented = true
		}) {
			Text("Show Details")
		}.popover(isPresented: $isPresented, arrowEdge: .top) {

			Spacer()
			Text("\(self.ad.name)")
			Text("Start running on day: \(self.ad.dayStartRunning)")
			Text("Spend per day: \(self.ad.dailySpend)")
			Spacer()
			Button(action: {
				self.isPresented = false
			}) {
				Text("Close")
			}
		}
		
	}
	
	/*
	var body: some View {
	
	let fields = VStack {
	Text("Loading...")
	
	//ActivityIndicator(isAnimating: .constant(true), style: .large)
	}
	
	
	return GeometryReader { geometry in
	ZStack {
	/* Alignment.(alignment: .center) */ {
	
	// this is the underlying "main" view
	self.content()
	.disabled(self.isShowing)
	.blur(radius: self.isShowing ? 3 : 0)
	
	// this is the 'panel' that pops up
	//					VStack {
	//						Text("Loading...")
	//						Text("\(ad.name)")
	//						Text("Start running on day: \(ad.dayStartRunning)")
	//						Text("Spend per day: \(ad.dailySpend)")
	//
	//						//ActivityIndicator(isAnimating: .constant(true), style: .large)
	//					}
	//						.disabled(self.isShowing)
	//						.blur(radius: self.isShowing ? 3 : 0)
	//
	
	
	}
	}
	.frame(width: geometry.size.width / 2,
	height: geometry.size.height / 5)
	.background(Color.secondary.colorInvert())
	.foregroundColor(Color.primary)
	.cornerRadius(20)
	.opacity(self.isShowing ? 1 : 0)
	
	}
	*/
}


struct AdSettingsView_Previews: PreviewProvider {
	
	static var stats = getTestUserData()

    static var previews: some View {
		AdSettingsView(ad:stats.ads[0])
    }
}
