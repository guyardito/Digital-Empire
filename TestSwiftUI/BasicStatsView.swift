//
//  BasicStatsView.swift
//  Digital Empire
//
//  Created by Guy (main) on 2/8/20.
//  Copyright © 2020 Rich Life LLC. All rights reserved.
//

import SwiftUI



func degreesFrom(pct:Int) -> Double {
	let rv =  360.0 * Double(pct) / 100.0
	
	return rv
}




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
					//Text("\(stats.creativity)")
					Text("Creativity").font(.caption)
					
				}.font(.title)
				.foregroundColor(.purple)
					.overlay ( Arc(startAngle: .degrees(0), endAngle: .degrees(degreesFrom(pct: stats.creativity)), clockwise: true)
					.stroke(Color.purple, lineWidth: 5)
					.frame(width: 60, height: 100)
				)
				
				Spacer()
				
				VStack {
					//Text("\(stats.precision)")
					Text("Precision").font(.caption)
					
				}.font(.title)
				.foregroundColor(.blue)
				.overlay ( Arc(startAngle: .degrees(0), endAngle: .degrees(degreesFrom(pct: stats.precision)), clockwise: true)
					.stroke(Color.blue, lineWidth: 5)
					.frame(width: 60, height: 100)
				)
				
				
				Spacer()
				VStack {
					//Text("\(stats.charm)")
					Text("Charm").font(.caption)
					
				}.font(.title)
				.foregroundColor(.yellow)
				.overlay ( Arc(startAngle: .degrees(0), endAngle: .degrees(degreesFrom(pct: stats.charm)), clockwise: true)
						.stroke(Color.yellow, lineWidth: 5)
						.frame(width: 60, height: 100)
				)
				
				Spacer()
				VStack {
					//Text("\(stats.drive)")
					Text("Drive").font(.caption)
					
				}.font(.title)
				.foregroundColor(.red)
				.overlay ( Arc(startAngle: .degrees(0), endAngle: .degrees(degreesFrom(pct: stats.drive)), clockwise: true)
						.stroke(Color.red, lineWidth: 5)
						.frame(width: 60, height: 100)
				)
				
				Spacer()
			}.frame(height: 70)
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

