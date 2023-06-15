//
//  AddNewLinkView.swift
//  language
//
//  Created by Mikhail Chudaev on 14.06.2023.
//

import SwiftUI

struct AddNewLinkView: View {
    @State var linkTitle = ""
    @State var link = ""
    @EnvironmentObject var linkViewModel: LinkViewModel
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("New link")
                    .font(.system(size: 20,  weight: .black))
                    .padding(.leading, 16)
                Spacer()
                Button {
                    linkViewModel.isShowAddLink.toggle()
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundColor(.black)
                }
            }
            
            VStack(alignment: .leading) {
                HStack {
                    TextField("Title", text: $linkTitle)
                }
                .padding(.vertical, 13)
                .padding(.horizontal, 23)
                .background(.gray)
                .cornerRadius(10)
                
                HStack {
                    TextField("Link", text: $link)
                }
                .padding(.vertical, 13)
                .padding(.horizontal, 23)
                .background(.gray)
                .cornerRadius(10)
                
            }
            Spacer()
            Button {
                //
            } label: {
                Text("Save")
                    .padding(.vertical, 13)
                    .frame(maxWidth: .infinity)
                    .background(.green)
                    .clipShape(Capsule())
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(15)
        .background(.white)
    }
}

struct AddNewLinkView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewLinkView()
    }
}
