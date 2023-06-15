//
//  LinkShowView.swift
//  language
//
//  Created by Mikhail Chudaev on 15.06.2023.
//

import SwiftUI

struct LinkShowView: View {
    
    @EnvironmentObject var linkViewModel: LinkViewModel
    
    @Binding var url: String
    
    @State var isLoad = false
    @State var title = ""
    
    var body: some View {
        
        ZStack {
            VStack(spacing: 0) {
                HStack {
                    Circle()
                        .frame(width: 30)
                        .foregroundColor(isLoad ? Color(.green) : Color(.black))
                    Spacer()
                    Text(title)
                        .padding(.trailing, 30)
                        .fontWeight(.bold)
                    Spacer()
                    Button {
                        linkViewModel.isShowLinkContent.toggle()
                    } label: {
                        Image(systemName: "xmark")
                        
                            .foregroundColor(.black)
                    }
                    
                }
                .padding(.horizontal, 15)
                .padding(.bottom, 10)
                .background(.gray)
                
                WebView(url: $url) { isLoad in
                    self.isLoad = isLoad
                }
            }
        }
        .onAppear {
            if let url = URL(string: url) {
                self.title = url.host ?? ""
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
