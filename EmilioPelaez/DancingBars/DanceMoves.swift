//
//  DanceMoves.swift
//  DancingBars
//
//  Created by Emilio Peláez on 16/07/22.
//

import Combine
import Foundation
import SwiftUI

class DanceMoves: ObservableObject {
	static let delay: TimeInterval = 0.35
	
	@Published var moves: [CGFloat] = Array(repeating: 0.5, count: 4).map { _ in CGFloat.random(in: 0...1) }
	
	let timer = Timer.publish(every: delay, on: .main, in: .common).autoconnect()

	var bag: Set<AnyCancellable> = []
	
	init() {
		timer
			.sink(receiveValue: update)
			.store(in: &bag)
	}
	
	func update(_ output: Timer.TimerPublisher.Output) {
		withAnimation(.easeInOut(duration: DanceMoves.delay)) {
			moves = moves.map { _ in CGFloat.random(in: 0...1) }
		}
	}
}
