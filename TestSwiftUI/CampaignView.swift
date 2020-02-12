//
//  CampaignView.swift
//  Digital Empire
//
//  Created by Guy Ardito on 2/11/20.
//  Copyright © 2020 Rich Life LLC. All rights reserved.
//

import SwiftUI





struct CampaignView: View {
	
	@ObservedObject var data:Campaign
		
	var body: some View {
		
		let mainView = VStack {
			HStack {
				Text("\(self.data.name):  ")
				Spacer()
				Text("start: \(self.data.startDay)")
				Spacer()
				Text("end: \(self.data.endDay)")
			}
			HStack {
				Text("\(self.data.percentWhoPurchase)% purchasing")
				Spacer()
				Text("Total adSpend: $\(self.data.adSpend)")
			}
			HStack {
				Text("Revenue: $\(self.data.revenue)")
				Spacer()
				Text("Profit: $\(self.data.profit)").bold()
			}
			//.foregroundColor(.green)
		}
	
		
		
		return HStack {
			Spacer(minLength: CGFloat(40))
			HStack {

				if data.isClosed {
					 mainView.foregroundColor(.gray)
				} else {
					 mainView
				}
				Spacer(minLength: CGFloat(40.0))
			}

			
//			VStack {
//				Spacer()
//				Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
//					Text("Pause")
//				}.buttonStyle(DefaultButtonStyle())
//				Spacer()
//				Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
//					Text("Cancel")
//				}.buttonStyle(DefaultButtonStyle())
//				Spacer()
//			}
			
		}
	}
}

struct CampaignView_Previews: PreviewProvider {
	
	static var cpn = Campaign(name: "cmpn 1", product: "Sell Your Soul", price: 499, startDay: 30, endDay: 37, percent: 2, adSpend: 500)

	
    static var previews: some View {

		CampaignView(data:cpn)
    }
}
