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
	@Published var isButtonEnabled = false
	
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
					// You will see the changed status true or false
					print("Changed: \(changed)")
					
					DispatchQueue.main.async {
						// To read the value from firebase, you can simply access remoteConfig["KEY_NAME"].stringValue or intValue
						self.textLabel = self.remoteConfig["textLabel"].stringValue ?? "default text"
						self.isButtonEnabled = self.remoteConfig["isButtonEnabled"].boolValue
						print("isButtonEnabled: \(self.remoteConfig["isButtonEnabled"].boolValue)")
					}
					
				}
			} else {
				print("Config not fetched, Error: \(error?.localizedDescription ?? "No error available")")
			}
		}
	} // END: fetchRemoteConfig
}
