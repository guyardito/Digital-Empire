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
	
	@EnvironmentObject var game : GameCoordinator
	
	

	
	
	
	
	
	
	var body: some View {
			
		
		
		let powerUpActionSheetView =
			ActionSheet(
				title: Text("What do you want to power up?"),
				message: Text(""),
				buttons: [
					// Influence  Organization  Drive  Vision
					.default(Text("Charm"), action: { self.game.powerUp(.Charm)   } ),
					.default(Text("Tech"), action: { self.game.powerUp(.Precision)   } ),
					.default(Text("Creativity"), action: { self.game.powerUp(.Creativity)   } ),
					.default(Text("Drive"), action: { self.game.powerUp(.Drive)   } ),
					
					.cancel()
					//.destructive(Text("Cancel"))
			] )
		
		
		
		let createActionSheetView =
			ActionSheet(
				title: Text("What do you want to create?"),
				message: Text(""),
				buttons: [
					.default(Text("Ad"), action: {  self.game.createAd()  } ),
					.default(Text("Lead Campaign"), action: {   } ),
					//.default(Text("Sales Page"), action: {   } ),
					.default(Text("Sales Campaign"), action: {   } ),
					.default(Text("Adjust Branding"), action: {   } ),
					//.default(Text("Hire Marketing Agency"), action: {   } ),
					//.default(Text("Hire Social Media Manager"), action: {   } ),
					//.default(Text("Hire Marketing Agency"), action: {   } ),
					
					.cancel()
			] )
		

		
		return VStack {
			
			HStack {
				Spacer()
				
				Button(action: { self.game.postBlog() }) {
					Text("Blog")
				}
				
				
				Spacer()

				Button(action: {
					self.isShowingCreateSheet = true
				}) {
					Text("Create")
				}
				.actionSheet(isPresented: $isShowingCreateSheet) {
					createActionSheetView
				}

				
				Spacer()

				Button(action: { self.game.postSocialMedia() } ) {
					Text("Social Media")
				}
				Spacer()
				
				
			}
			
			Spacer(minLength: CGFloat(20))
			
			HStack {
				Spacer()
				
				Button(action: { self.game.playChanceCard() }) {
					Text("Chance Card")
				}
				
				Spacer()
				
				Button(action:  {
					withAnimation {
						self.game.stats.showOutsourcers = !self.game.stats.showOutsourcers
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
					powerUpActionSheetView
				}
				
				Spacer()
				
			}
			
		}
	}
}



struct ControlPanel_Previews: PreviewProvider {
    static var previews: some View {
		let game = GameCoordinator()

		return ControlPanelView().environmentObject(game)
    }
}
