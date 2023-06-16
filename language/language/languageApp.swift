//
//  languageApp.swift
//  language
//
//  Created by Mikhail Chudaev on 14.06.2023.
//

import SwiftUI

@main
struct languageApp: App {
    var body: some Scene {
        let _ = print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
        WindowGroup {
            ContentView()
                .preferredColorScheme(.light)
        }
    }
}
