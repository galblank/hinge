//
//  HingeApp.swift
//  Hinge
//
//  Created by Gal Blank on 4/8/23.
//

import SwiftUI

@main
struct HingeApp: App {
    let repo = PronounsRepo()
    var body: some Scene {
        WindowGroup {
            ContentView(dataRepo: repo)
        }
    }
}
