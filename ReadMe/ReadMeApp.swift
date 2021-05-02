//
//  ReadMeApp.swift
//  ReadMe
//
//  Created by wizz on 4/25/21.
//

import SwiftUI

@main
struct ReadMeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Library())
        }
    }
}
