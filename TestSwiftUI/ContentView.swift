//
//  ContentView.swift
//  TestSwiftUI
//
//  Created by Guy (main) on 2/8/20.
//  Copyright © 2020 Rich Life LLC. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		VStack {
			
			HStack {
				Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
					Text(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/)
				}
				Text("Hello, World!")

			}
			
			Spacer(minLength: 20)
			
			HStack {
				Text("Living Expenses: $4,300")
				Text("Business Expenses: $2,600")
			}
			
			Spacer(minLength: 40)

			List {
				MarketingView()
				MarketingView()
				MarketingView()
			}

			HStack {
				Spacer()
				
				Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
					Text("Change Spend")
				}
				Spacer()
				
				Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
					Text("Boost")
				}
				Spacer()
				
				Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
					Text("Chance Card")
				}
				Spacer()
				
			}
			Spacer(minLength: CGFloat(20))
			HStack {
				Spacer()
				
				Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
					Text("New Ad")
				}
				Spacer()

				Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
					Text("New Post")
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

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
