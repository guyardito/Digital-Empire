//
//  ContentView.swift
//  TestSwiftUI
//
//  Created by Guy (main) on 2/8/20.
//  Copyright © 2020 Rich Life LLC. All rights reserved.
//

import SwiftUI



struct GameView: View {
	

	@EnvironmentObject var game : GameCoordinator
	@ObservedObject var stats : Stats
	
	
	var body: some View {
		VStack {

			BasicStatsView(stats: game.stats).frame(width: nil, height: CGFloat(200), alignment: .center)
			
			Spacer(minLength: CGFloat(60))

			if game.stats.showOutsourcers {
				OutsourceView(stats:game.stats)
					.transition(.move(edge: .bottom))
			} 
			
			//CreatableItemList(stats:game.stats)

			ScrollView(.horizontal) {
				ZStack {
					Color.yellow
					HStack {
						ForEach(stats.inactiveCreatableItemProxies)  { proxy in
							Button(action: { print("\(proxy.item.getName())")  }  ) {
								CreatableItemView(item: proxy.item, itemStatus: proxy.item.status)
							}
						}
						.padding(.horizontal, CGFloat(70) )
					}
				}
			} .frame(height: 150)
			
			
			ScrollView(.horizontal) {
				ZStack {
					Color.orange
					HStack {
						ForEach(stats.activeCreatableItemProxies)  { proxy in
							Button(action: { print("\(proxy.item.getName())")  }  ) {
								CreatableItemView(item: proxy.item, itemStatus: proxy.item.status)
							}
						}
						.padding(.horizontal, CGFloat(70) )
					}
				}
			} .frame(height: 150)
			

			
			/*
			// lead campaigns
			ScrollView(.horizontal)  {
				ZStack {
					Color.orange
					HStack {
						// multiple status view here
						
						ForEach(stats.leadCampaigns) { item in
							Button(action: {
								print("\(item.getName())")}
							) {
								CreatableItemView(item: item, itemStatus: item.status)
							}
							
						}
						.padding(.horizontal, 10)
					}
				}
			}.frame(height: 100)
			*/
			
			
			// ads
			List {
				ForEach(stats.ads, id:\.self.name) { data in
					AdView(data:data )
				}
			}
		
			Spacer(minLength: CGFloat(40))

			// sales campaigns
//			List {
//				ForEach(game.stats.salesCampaigns, id:\.self.name) { data in
//					SalesCampaignView(data:data)
//					
//					// NB  having trouble getting 'if / else' to compile within ForEach,
//					// so moved the logic to within the row's View
//				}
//				
//			}

			Spacer(minLength: CGFloat(20))
			
			ControlPanelView().frame(width: nil, height: CGFloat(60), alignment: .center)//.environmentObject(game)
			
			
			// Spacer(minLength: CGFloat(20))

			
		}
	}
}



var game = GameCoordinator(stats: getTestUserData() )


struct ContentView_Previews: PreviewProvider {
	
	// NB this *MUST* be 'static' in order to compile!
	static var stats = getTestUserData()
	
	
	static var previews: some View {

		GameView(stats:stats)
			.environmentObject(game)
	}
}
