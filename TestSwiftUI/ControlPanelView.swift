//
//  ControlPanel.swift
//  Digital Empire
//
//  Created by Guy Ardito on 2/11/20.
//  Copyright © 2020 Rich Life LLC. All rights reserved.
//

import SwiftUI

struct ControlPanelView: View {
	@State var isShowingCreateSheet = false
	@State var isShowingPowerupSheet = false
	
	@EnvironmentObject var stats : Stats
	
	
	var body: some View {
		return VStack {
			HStack {
				Spacer()
				
				Button(action: {}) {
					Text("Blog")
				}
				
				
				Spacer()

				Button(action: {
					self.isShowingCreateSheet = true
				}) {
					Text("Create")
				}
				.actionSheet(isPresented: $isShowingCreateSheet) {
					ActionSheet(title: Text("What do you want to create?"),
								message: Text(""),
								buttons: [
									.default(Text("Ad")),
									.default(Text("Lead Campaign")),
									.default(Text("Sales Page")),
									.default(Text("Sales Campaign")),
									.default(Text("Adjust Branding")),
									.default(Text("Hire Marketing Agency")),
									
									.cancel()
					] )
				}

				
				Spacer()

				Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
					Text("Social Media")
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
				
				Button(action:  {
					withAnimation {
						self.stats.showOutsourcers = !self.stats.showOutsourcers
					}
				}) {
					Text("???")
				}
				Spacer()
				
				Button(action: {
					self.isShowingPowerupSheet = true
				}) {
					Text("Power-up")
				}
				.actionSheet(isPresented: $isShowingPowerupSheet) {
					ActionSheet(title: Text("What do you want to power up?"),
								message: Text(""),
								buttons: [
									.default(Text("Copywriting"), action: {   } ),
									.default(Text("Tech"), action: {   } ),
									.default(Text("Influence"), action: {   } ),
									.default(Text("Audacity"), action: {   } ),
									
									.cancel()
									//.destructive(Text("Cancel"))
					] )
				}
				Spacer()
				
			}
			
		}
	}
}

struct ControlPanel_Previews: PreviewProvider {
    static var previews: some View {
        ControlPanelView()
    }
}
