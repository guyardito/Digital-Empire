//
//  UserData.swift
//  Digital Empire
//
//  Created by Guy (main) on 2/8/20.
//  Copyright © 2020 Rich Life LLC. All rights reserved.
//

import Foundation
import Combine

///Last I recall, BindableObject was renamed to ObservableObject and @ObjectBinding is now @ObservedObject. Additionally, in an ObservableObject you no longer need to implement didChange yourself, you just use the @Published attribute on any properties you want to publish and the rest will be taken care of for you.

final class UserData : ObservableObject {
	
	// PassthroughSubject is publisher from Combine framework; it immediately passes any values to its subscribers.
	// SwiftUI subscribes to your object through this publisher and updates any views that need refreshing when data changes
	let changePublisher = PassthroughSubject<UserData, Never>() // return 'UserData' instance, and 'Never' throw an error
	
	
	// when property value changes make sure to publish it!  Use 'didSet'

	var stats = Stats() {
		didSet {
			changePublisher.send(self)
		}
	}
}


