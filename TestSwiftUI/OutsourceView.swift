//
//  OutsourceView.swift
//  Digital Empire
//
//  Created by Guy Ardito on 2/11/20.
//  Copyright © 2020 Rich Life LLC. All rights reserved.
//

import SwiftUI

struct OutsourceView: View {
	
	@ObservedObject var stats : Stats

	
	
	var body: some View {
		VStack {

			//Spacer(minLength: 20)
			
			HStack {
				Spacer()
				VStack {
					Text("\(stats.followers)")
					Text("Agency").font(.caption)
					
				}
				Spacer()
				VStack {
					Text("\(stats.subscribers)")
					Text("Coach").font(.caption)
					
				}
				Spacer()
			}.font(.title).foregroundColor(.orange)
			
			
			//Spacer(minLength: 20)
	
		}
	}
}



struct OutsourceView_Previews: PreviewProvider {
	static var stats = getTestUserData()

    static var previews: some View {
		OutsourceView(stats:stats)
    }
}
