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
									.default(Text("Lead Page")),
									.default(Text("Lead Magnet")),
									.default(Text("Sales Page")),
									.default(Text("Campaign")),
									
									.cancel()
					])
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

struct ControlPanel_Previews: PreviewProvider {
    static var previews: some View {
        ControlPanelView()
    }
}
