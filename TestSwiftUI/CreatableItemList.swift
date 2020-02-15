//
//  CreatableItemList.swift
//  Digital Empire
//
//  Created by Guy Ardito on 2/13/20.
//  Copyright © 2020 Rich Life LLC. All rights reserved.
//

import SwiftUI


struct CreatableItemList: View {
	
	//@EnvironmentObject var game:GameCoordinator
	
	@ObservedObject var stats:Stats  // NB need this declaration to recognize changes to the array

	var body: some View {
		ScrollView(.horizontal)  {
			ZStack {
			Color.yellow
			HStack {
				// multiple status view here

				ForEach(stats.creatableItemProxies) { item in
					Button(action: {
						print("\(item.item.getName())")}
) {
						CreatableItemView(item: item)
					}
				
				}
				.padding(.horizontal, 10)
			}
			}
		}.frame(height: 100)
		
	}
}


struct CreatableItemList_Previews: PreviewProvider {
	
	static let stats = getTestUserData()
	

    static var previews: some View {
		//CreatableItemList(items:ads)
		CreatableItemList(stats: stats)
    }
}
