//
//  ContentView.swift
//  TestSwiftUI
//
//  Created by Guy (main) on 2/8/20.
//  Copyright © 2020 Rich Life LLC. All rights reserved.
//

import SwiftUI



struct GameView: View {
	

	@ObservedObject var stats : Stats
	
	
	var body: some View {
		VStack {

			BasicStatsView(stats: stats).frame(width: nil, height: 200, alignment: .center)
			
			Spacer(minLength: CGFloat(20))

			
			List {
				ForEach(stats.ads, id:\.self.name) { data in
					MarketingView(data:data)
				}
			}
			
			
			
			HStack {
				Spacer()
				
				Button(action: {
					print("hey")
					//self.stats.ads[0].objectWillChange.send()
					self.stats.ads[0].clickThru += 1 }) {
					Text("Build")
						//
				}
				Spacer()
				
				Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
					Text("Publish")
						// sales page
						// blog post
				}
				Spacer()
				
				Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
					Text("Run")
						// advertisement
						// post
						
				}
				Spacer()
				
			}
			Spacer(minLength: CGFloat(20))
			HStack {
				Spacer()
				
				Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
					Text("Chance Card")
				}
				Spacer()

				Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
					Text("???")
				}
				Spacer()

				Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
					Text("Power-up")
				}
				Spacer()

			}
			
		}
	}
}


func getUserData() -> Stats {
	
	let stats = Stats()
	
	let ads = [
		AdData(name: "ad 1", dailySpend: 5, clickThru: 4, totalClicks: 2391),
		AdData(name: "ad 2", dailySpend: 3, clickThru: 8, totalClicks: 430),
		AdData(name: "ad 3", dailySpend: 7, clickThru: 2, totalClicks: 3096)
		
	]
	
	stats.ads = ads

	return stats
}


struct ContentView_Previews: PreviewProvider {
	
	// NB this *MUST* be 'static' in order to compile!
	static var stats = getUserData()
		
	
	static var previews: some View {

		GameView(stats: stats)
	}
}
