//
//  BasicStatsView.swift
//  Digital Empire
//
//  Created by Guy (main) on 2/8/20.
//  Copyright © 2020 Rich Life LLC. All rights reserved.
//

import SwiftUI

struct BasicStatsView: View {
	
	
	
	@ObservedObject var stats : Stats
	
	
	
	var body: some View {
		VStack {
			
//			HStack {
//				Text("Living Expenses: $4,300")
//				Text("Business Expenses: $2,600")
//			}
			Spacer()
			HStack {
				Spacer()
				VStack {
					Text("\(stats.audienceEngagement)")
					Text("Engagement").font(.caption)
					
				}
				Spacer()
				VStack {
					Text("\(stats.audienceCongruence)")
					Text("Congruence").font(.caption)
					
				}
				Spacer()
			}.foregroundColor(.gray)


			
			Spacer(minLength: 20)
			
			HStack {
				Spacer()
				VStack {
					Text("\(stats.followers)")
					Text("Followers").font(.caption)
					
				}
				Spacer()
				VStack {
					Text("\(stats.subscribers)")
					Text("Subscribers").font(.caption)
					
				}
				Spacer()
			}.font(.title).foregroundColor(.blue)

			
			Spacer(minLength: 20)
			
			HStack {
				Spacer()
				
				VStack {
					Text("\(stats.gameTimeInDays)")
					Text("Day").font(.caption)
					
				}
				Spacer()
				VStack {
					Text("\(stats.money)")
					Text("Money").font(.caption)
					
				}
				Spacer()
				VStack {
					Text("\(stats.powerUpPoints)")
					Text("Power Points").font(.caption)
					
				}

				Spacer()
			}.font(.title).foregroundColor(.red)
			
			Spacer(minLength: CGFloat(10))
			
			
			HStack {
				Spacer()
				VStack {
					Text("\(stats.influence)")
					Text("Copywriting").font(.caption)
					
				}
				Spacer()
				VStack {
					Text("\(stats.compliance)")
					Text("Tech").font(.caption)
					
				}
				Spacer()
				VStack {
					Text("\(stats.influence)")
					Text("Influence").font(.caption)
					
				}
				Spacer()
				VStack {
					Text("\(stats.drive)")
					Text("Audacity").font(.caption)
					
				}
				Spacer()
			}.font(.title).foregroundColor(.purple)
		}
	}
}





struct BasicStatsView_Previews: PreviewProvider {
	static var stats = getTestUserData()
	
    static var previews: some View {
		// NB this *MUST* be 'static' in order to compile!
		
		BasicStatsView(stats: stats)
		
		
		}
}

