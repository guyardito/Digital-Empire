//
//  Events.swift
//  Digital Empire
//
//  Created by Guy (main) on 2/6/20.
//  Copyright © 2020 Rich Life LLC. All rights reserved.
//

import Foundation

protocol Event {
	
}




enum UserEvent : Event {
	case createAd
	case runAd
	case cancelAd
	
	
	case buildOptin
	case buildWebsite
	case buildFreebie
	case attendConference
	
	case contractDesigner
	case contractCopywriter
	
	case studyCopywriting
	case studyTechnology
	case studyInfluence
	case studyConfidence   // via NLPCoach
	
	case hostWebinar
	
}


enum SpecialEvent : Event {
	case crossedSubscriberThreshold(number:Int) // 1000, 10,000  100,000  1,000,000
	
	case crossedRevenueThreshold(amount:Int)
	
	case crossedInGamePurchaseThreshold(amount:Int)  // 25, 50, 100, 200
	
}




enum GameEvent {
	// can only happen if you have an OptIn
	case addSubscribers(number:Int)
	case loseSubscribers(number:Int)
	
	case openedEmail(percent:Int)
	
	// can only happen if you run an Ad
	case clickedOnAd(number:Int)
	
}


enum ChanceEvent {
	
	// bad
	case websiteDown
	case paymentProcessingDown
	case userComplains
	case InfluenceComplains
	case socialMediaCancelsYourAccount
	case userSues
	
	// good
	case influencerPraises
	case postingGoesViral
	
	//
	case attendConferenceAndMeetJV
	case attendConferenceAndMeetSpeaker
	
}

