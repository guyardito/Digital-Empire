//
//  Events.swift
//  Digital Empire
//
//  Created by Guy (main) on 2/6/20.
//  Copyright © 2020 Rich Life LLC. All rights reserved.
//

import Foundation

enum Event {
	
}

enum gameEvent {
	case addSubscribers(number:Int)
	case loseSubscribers(number:Int)
	
	case openedEmail(percent:Int)
	
	case clickedOnAd(number:Int)
	
}

enum eventChance {
	case websiteDown
	
	case paymentProcessingDown
	
	case userComplains
	case InfluenceComplains
	case influencerPraises
	
	case postingGoesViral
	
	case attendConferenceAndMeetJV
	case attendConferenceAndMeetSpeaker
}


enum userEvent {
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
