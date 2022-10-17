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
	
	private let remoteConfig = RemoteConfig.remoteConfig()
	private let remoteConfigSettings = RemoteConfigSettings()
	
	
	func setupRemoteConfigDefaults() {
		// set remote config
		self.remoteConfigSettings.minimumFetchInterval = 0
		self.remoteConfig.configSettings = remoteConfigSettings
		
		// setup default value
		let defaultValues = [
			"textLabel": "Default text" as NSObject,
			"textLabel2": "Default text2" as NSObject
		]
		
		remoteConfig.setDefaults(defaultValues)
	}
	
	func fetchRemoteConfig() {
		
		let remoteConfigSettings = RemoteConfigSettings()
		// FIXME: remove this before we go into production, debug settings
		remoteConfigSettings.minimumFetchInterval = 0
		
		RemoteConfig.remoteConfig().fetch(withExpirationDuration: 0) { (status, error) in
			guard error == nil else {
				print("Got an error fetching remote values: \(error)")
				return
			}
			
			print("Yeah! Received values from the cloud!")
			RemoteConfig.remoteConfig().
			
		}
	}
}
