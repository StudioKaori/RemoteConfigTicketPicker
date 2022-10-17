//
//  TicketPickerApp.swift
//  TicketPicker
//
//  Created by Kaori Persson on 2022-10-17.
//

import SwiftUI

@main
struct TicketPickerApp: App {
	// register app delegate for Firebase setup
	@UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
	
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
