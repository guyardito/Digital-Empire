//
//  MarketingElement.swift
//  Digital Empire
//
//  Created by Guy Ardito on 2/11/20.
//  Copyright © 2020 Rich Life LLC. All rights reserved.
//

import Foundation


enum MarketingItemStatus {
	case Pending
	case Running
	case Ended
}




enum MarketingElement {
	case Ad(ad:Ad)
	
	case Campaign(campaign:SalesCampaign)
}


