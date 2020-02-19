//
//  CreatableItemView.swift
//  Digital Empire
//
//  Created by Guy Ardito on 2/13/20.
//  Copyright © 2020 Rich Life LLC. All rights reserved.
//

import SwiftUI

func getCenter(rect:CGRect) -> CGPoint {
	
	let x = rect.origin.x + rect.size.width / 2
	let y = rect.origin.y + rect.size.height / 2
	
	return CGPoint(x:x, y:y)
}




struct Arc: Shape {
	var startAngle: Angle
	var endAngle: Angle
	var clockwise: Bool
	
	func path(in rect: CGRect) -> Path {
		let rotationAdjustment = Angle.degrees(90)
		let modifiedStart = startAngle - rotationAdjustment
		let modifiedEnd = endAngle - rotationAdjustment
		
		var path = Path()
		path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
		
		return path
	}
}





struct CreatableItemView: View {
	
	@State var item:CreatableItem
	@State var itemStatus:CreatableItemStatus
	
	
	
	struct MyShape : Shape {
		var center:CGPoint
		
		func path(in rect: CGRect) -> Path {
			var p = Path()
			
			p.addArc(center: center, radius: 50, startAngle: .degrees(0), endAngle: .degrees(90), clockwise: true)
			//p.addArc(center: CGPoint(x: 100, y:100), radius: 50, startAngle: .degrees(0), endAngle: .degrees(90), clockwise: true)

			return p.strokedPath(.init(lineWidth: 3, dash: [5, 3], dashPhase: 10))
		}
	}
	
	
	
	
	
	func colorForStatus(status:CreatableItemStatus) -> Color {
		switch item.status {
			case .NotStarted:
				return .gray
			
			case .Building:
				return .orange
			
			case .Ready:
				return .black
			
			case .Active:
				return .green
			
			case .Paused:
				return .yellow
			
		}
	}
	
	
	var body: some View {
		
		let body = 	Group {
			Text("\(item.getName()): \(item.getItemType().rawValue)")
			Text("Build: \(item.getDayStartedCreating())  \(item.getDayStartedCreating()+item.getDaysToCreate())")
			Text("\(item.status.rawValue)")
		}.frame(width:100)
		
		
		return
			
			GeometryReader { geometry in
				//let frame = geometry.frame(in: CoordinateSpace.local)
				
				VStack {
					/*
					// NB can't have 'switch' w/o getting error: "Closure containing control flow statement cannot be used with function builder ViewBuilder."
					
					switch item.item.status {
					case .NotStarted:
					body.foregroundColor(.gray)
					
					case .Building:
					body.foregroundColor(.orange)
					
					case .Ready:
					body.foregroundColor(.black)
					*/
					
					
					return	body
					
					
				}
				.frame(height:100)
				.foregroundColor(self.colorForStatus(status: self.item.status))
				.padding()
				.overlay (
				Arc(startAngle: .degrees(0), endAngle: .degrees(310), clockwise: true)
					.stroke(Color.blue, lineWidth: 10)
					.frame(width: 130, height: 100)
				)
				/*
				.overlay(
					Capsule(style: .continuous)
						.stroke(Color.purple, style: StrokeStyle(lineWidth: 5, dash: [10]))
				)
				*/
				
				/*
				RoundedRectangle(cornerRadius: 60)
				.stroke(Color.purple, lineWidth: 5)
				)
				*/
				//MyShape(center: getCenter( rect: geometry.frame ) )
			}
		
	}
}


struct CreatableItemView_Previews: PreviewProvider {
	static var ad = Ad(name: "ad 6", dailySpend: 8, clickThru: 4, totalClicks: 2391, costPerClick: 7.25, dayStartRunning: 15, dayStartCreating: 3, daysToCreate: 10)
	
    static var previews: some View {
		//CreatableItemView(item: CreatableItemProxy(item:ad) )
		CreatableItemView(item:ad, itemStatus: ad.status)
    }
}
