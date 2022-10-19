//
//  ContentView.swift
//  TicketPicker
//
//  Created by Kaori Persson on 2022-10-17.
//

import SwiftUI

struct ContentView: View {
	@StateObject var viewModel = ViewModel()
	
	var body: some View {
		VStack {
			Image(systemName: "globe")
				.imageScale(.large)
				.foregroundColor(.accentColor)
			
			Text("Here's the text from Remote config:")
			Text(viewModel.textLabel)
			
			if viewModel.isButtonEnabled {
				Text("Experamental button")
			}
		}
		.padding()
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
