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
		ScrollView(.horizontal) {
			ZStack {
				
				Color.yellow
				HStack {
					// multiple status view here
					
					// NB it *seems* like we need to use path ".id" for this to work, NOT (for example) ".uid"
					//ForEach(stats.genericCreatables, id: \.id)  { item in
					
					ForEach(stats.creatableItemProxies)  { proxy in
						
						Button(action: { print("\(proxy.item.getName())")  }  )
						{
							// NB passing the wrong type here (like just 'item') results in a weird error: Cannot convert value of type 'ZStack<TupleView<(Color, HStack<some View>)>>' to closure result type '_'
							CreatableItemView(item: proxy.item, itemStatus: proxy.item.status)
							
						}
						
					}
					.padding(.horizontal, CGFloat(10) )
					
				}
				
			}
		} .frame(height: 100)
		
	}
}


struct CreatableItemList_Previews: PreviewProvider {
	
	static let stats = getTestUserData()
	

    static var previews: some View {
		//CreatableItemList(items:ads)
		CreatableItemList(stats: stats)
    }
}
