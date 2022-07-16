//
//  Bars.swift
//  DancingBars
//
//  Created by Emilio Peláez on 16/07/22.
//

import SwiftUI

struct Bars: View {
	@ObservedObject var sick = DanceMoves()
	
	@State var height: CGFloat = 0
	
	var body: some View {
		ZStack(alignment: .bottom) {
			Color.clear.storeHeight(in: $height)
			HStack(alignment: .bottom, spacing: 10) {
				ForEach(0..<4) { index in
					RoundedRectangle(cornerRadius: 2, style: .continuous)
						.foregroundStyle(.green)
						.frame(height: height * sick.moves[index])
				}
			}
		}
	}
}

struct Bars_Previews: PreviewProvider {
	static var previews: some View {
		Bars()
			.frame(width: 230, height: 230)
			.padding()
			.previewLayout(.sizeThatFits)
	}
}
