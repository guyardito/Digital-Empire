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

			BasicStatsView(stats: stats).frame(width: nil, height: CGFloat(200), alignment: .center)
			
			Spacer(minLength: CGFloat(60))

			if stats.showOutsourcers {
				OutsourceView(stats:stats)
					.transition(.move(edge: .bottom))
			} 
			
			// ads
			List {
				ForEach(stats.ads, id:\.self.name) { data in
					AdView(data:data )
				}
			}
			
			Spacer(minLength: CGFloat(40))
			
			// campaigns
			List {
				ForEach(stats.campaigns, id:\.self.name) { data in
					CampaignView(data:data)
					
					// NB  having trouble getting 'if / else' to compile within ForEach,
					// so moved the logic to within the row's View
				}
				
			}
			
			Spacer(minLength: CGFloat(20))
			
			ControlPanelView().frame(width: nil, height: CGFloat(60), alignment: .center)
			
			
			// Spacer(minLength: CGFloat(20))

			
		}
	}
}



var game = GameCoordinator(stats: getTestUserData() )


struct ContentView_Previews: PreviewProvider {
	
	// NB this *MUST* be 'static' in order to compile!
	static var stats = getTestUserData()
	
	
	static var previews: some View {

		GameView(stats: stats)
			.environmentObject(stats)
			.environmentObject(game)
	}
}
