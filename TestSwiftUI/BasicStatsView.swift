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
			
			HStack {
				Text("Living Expenses: $4,300")
				Text("Business Expenses: $2,600")
			}
			
			Spacer(minLength: 20)
			
			HStack {
				Spacer()
				VStack {
					Text("\(stats.gameTimeInDays)")
					Text("Day").font(.caption)
					
				}
				Spacer()
				VStack {
					Text("$32,800")
					Text("Money").font(.caption)
					
				}
				Spacer()
			}.font(.title).foregroundColor(.red)
			
			Spacer(minLength: CGFloat(10))
			
			
			HStack {
				Spacer()
				VStack {
					Text("67")
					Text("Copywriting").font(.caption)
					
				}
				Spacer()
				VStack {
					Text("53")
					Text("Tech").font(.caption)
					
				}
				Spacer()
				VStack {
					Text("67")
					Text("Influence").font(.caption)
					
				}
				Spacer()
				VStack {
					Text("53")
					Text("Audacity").font(.caption)
					
				}
				Spacer()
			}.font(.title).foregroundColor(.purple)
		}
	}
}





struct BasicStatsView_Previews: PreviewProvider {
	static var stats = getUserData()
	
    static var previews: some View {
		// NB this *MUST* be 'static' in order to compile!
		
		BasicStatsView(stats: stats)
		
		
		}
}

