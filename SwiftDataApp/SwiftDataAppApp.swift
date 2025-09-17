//
//  SwiftDataAppApp.swift
//  SwiftDataApp
//
//  Created by Arman on 16/9/25.
//

import SwiftUI
import SwiftData
@main
struct SwiftDataAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: Destination.self)
    }
}
