//
//  ContentView.swift
//  TestSwiftUI
//
//  Created by Guy (main) on 2/8/20.
//  Copyright © 2020 Rich Life LLC. All rights reserved.
//

import SwiftUI



struct GameView: View {
	

	//@State var adDataArray: [AdData]
	@State var stats : Stats
	
	
	var body: some View {
		VStack {
			/*
			HStack {
				Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
					Text(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/)
				}
				Text("Hello, World!")

			}
			
			Spacer(minLength: CGFloat(20))
			*/
			HStack {
				Text("Living Expenses: $4,300")
				Text("Business Expenses: $2,600")
			}
			
			Spacer(minLength: 20)
			
			HStack {
				Spacer()
				Text("Day: 67")
				Spacer()
				Text("Money: $32,800")
				Spacer()
			}.font(.title).foregroundColor(.red)

			Spacer(minLength: CGFloat(10))


				
			VStack {
				Text("Copywriting: 67")
				Text("Tech: 67")
				Text("Influence: 67")
				Text("Audacity: 67")

			}.font(.subheadline).foregroundColor(.purple)
			
			Spacer(minLength: CGFloat(20))

			
			List {
				ForEach(stats.ads, id:\.self.name) { data in
					MarketingView(data:data)
				}
			}
			
			
			
			HStack {
				Spacer()
				
				Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
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
		AdData(name: "ad 1", clickThru: 4, totalClicks: 2391),
		AdData(name: "ad 2", clickThru: 8, totalClicks: 430),
		AdData(name: "ad 3", clickThru: 2, totalClicks: 3096)
		
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
