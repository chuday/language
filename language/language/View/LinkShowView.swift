//
//  LinkShowView.swift
//  language
//
//  Created by Mikhail Chudaev on 15.06.2023.
//

import SwiftUI

struct LinkShowView: View {
    
    @EnvironmentObject var linkViewModel: LinkViewModel
    
    @State var url: String
    @State var isLoaded = false
    @State var title = ""
    
    var body: some View {
        
        ZStack {
            VStack(spacing: 0) {
                WebView(url: $url) { isLoad in
                    self.isLoaded = isLoad
                }
            }
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Circle()
                .frame(width: 30)
                .foregroundColor(isLoaded ? Color(.green) : .black)
            )
        }
        .onAppear {
            if let url = URL(string: url) {
                self.title = url.host ?? ""
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
