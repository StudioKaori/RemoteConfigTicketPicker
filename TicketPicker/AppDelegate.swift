//
//  AppDelegate.swift
//  TicketPicker
//
//  Created by Kaori Persson on 2022-10-17.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
	func application(_ application: UIApplication,
									 didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
		FirebaseApp.configure()

		return true
	}
}
