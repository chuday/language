//
//  LinksView.swift
//  language
//
//  Created by Mikhail Chudaev on 14.06.2023.
//

import SwiftUI
import RealmSwift

struct LinksView: View {
    
    @EnvironmentObject var linkViewModel: LinkViewModel
    @ObservedResults(LinkModel.self) var links
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
            ScrollView() {
                VStack(spacing: 10) {
                    
                    ForEach(links, id: \.id) { link in
                        LinkItem(link: link) { _ in
                            $links.remove(link)
                            
                        }
                    }
                    
                    
                }
            }
            .padding(.horizontal, 15)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Button {
                linkViewModel.isShowAddLink.toggle()
            } label: {
                ZStack {
                    Circle()
                        .frame(width: 56, height: 56)
                        .foregroundColor(.green)
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                }
            }
            .offset(x: -20, y: -30)
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
}

struct LinkItem: View {
    
    var link: LinkModel
    
    var onDelete: (Bool)->()
    @EnvironmentObject var linkViewModel: LinkViewModel
    
    var body: some View {
        
        HStack {
            HStack(spacing: 15) {
                Image(systemName: "link")
                Text(link.linkName)
                    .font(.system(size: 14))
            }
            Spacer()
            Button {
                onDelete(true)
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.black)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(20)
        .background(.gray)
        .cornerRadius(10)
        .onTapGesture {
            linkViewModel.isShowLinkContent.toggle()
            linkViewModel.openUrl = link.link
        }
    }
}

struct LinksView_Previews: PreviewProvider {
    static var previews: some View {
        LinksView()
    }
}
