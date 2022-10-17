//
//  ViewModel.swift
//  TicketPicker
//
//  Created by Kaori Persson on 2022-10-17.
//

import SwiftUI
import Firebase

class ViewModel: ObservableObject {
	@Published var textLabel = "Default"
	
	func setupRemoteConfigDefaults() {
		let defaultValues = [
			"textLabel": "Default text" as NSObject,
			"textLabel2": "Default text2" as NSObject
		]
		
		RemoteConfig.remoteConfig().setDefaults(defaultValues)
	}
	
	func fetchRemoteConfig() {
		
	}
}
