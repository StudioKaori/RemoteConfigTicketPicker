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
	
	private let remoteConfig: RemoteConfig
	
	init() {
		remoteConfig = RemoteConfig.remoteConfig()
		let settings = RemoteConfigSettings()
		settings.minimumFetchInterval = 0
		remoteConfig.configSettings = settings
		setupRemoteConfigDefaults()
		fetchRemoteConfig()
	}
	
	private func setupRemoteConfigDefaults() {
		// set up default values in plist
		remoteConfig.setDefaults(fromPlist: "RemoteConfigDefaults")
		
		// setup default value in the function
		//		let defaultValues = [
		//			"textLabel": "Default text" as NSObject,
		//			"textLabel2": "Default text2" as NSObject
		//		]
		//
		//		remoteConfig.setDefaults(defaultValues)
	}
	
	private func fetchRemoteConfig() {
		
		remoteConfig.fetch { (status, error) -> Void in
			if status == .success {
				print("Config fetched!")
				self.remoteConfig.activate { (changed, error) in
					print("Changed \(changed)")
					DispatchQueue.main.async {
						self.textLabel = self.remoteConfig["textLabel"].stringValue ?? "default text"
					}
					
				}
			} else {
				print("Config not fetched, Error: \(error?.localizedDescription ?? "No error available")")
			}
		}
	} // END: fetchRemoteConfig
}
