//
//  ContentView.swift
//  DancingBars
//
//  Created by Emilio Peláez on 16/07/22.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		Bars()
			.frame(width: 230, height: 230)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
