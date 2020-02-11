//
//  ControlPanel.swift
//  Digital Empire
//
//  Created by Guy Ardito on 2/11/20.
//  Copyright © 2020 Rich Life LLC. All rights reserved.
//

import SwiftUI

struct ControlPanelView: View {
	
	var body: some View {
		return VStack {
			HStack {
				Spacer()
				
				Button(action: {}) {
					Text("Blog")
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
