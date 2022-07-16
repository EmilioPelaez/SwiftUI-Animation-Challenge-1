//
//  UIView+Size.swift
//  DancingBars
//
//  Created by Emilio Peláez on 16/07/22.
//

import SwiftUI

public extension View {
	
	func storeSize(in binding: Binding<CGSize>) -> some View {
		onSizeChange { binding.wrappedValue = $0 }
	}
	
	func storeWidth(in binding: Binding<CGFloat>) -> some View {
		onSizeChange { binding.wrappedValue = $0.width }
	}
	
	func storeHeight(in binding: Binding<CGFloat>) -> some View {
		onSizeChange {
			binding.wrappedValue = $0.height
			print($0)
		}
	}
	
	func onSizeChange(_ closure: @escaping (CGSize) -> Void) -> some View {
		background {
			GeometryReader { proxy in
				Color.clear
					.preference(key: SizePreferenceKey.self, value: proxy.size)
			}
		}
		.onPreferenceChange(SizePreferenceKey.self, perform: closure)
	}
	
}

struct SizePreferenceKey: PreferenceKey {
	static var defaultValue: CGSize = .zero
	
	static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
		value = nextValue()
	}
}
