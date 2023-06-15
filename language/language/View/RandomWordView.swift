//
//  RandomWordView.swift
//  language
//
//  Created by Mikhail Chudaev on 14.06.2023.
//

import SwiftUI

struct RandomWordView: View {
    
    @State var isShowTranslate = false
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                VStack(spacing: 23) {
                    VStack(alignment: .leading) {
                        Text("TR")
                            .font(.system(size: 12, weight: .black))
                            .padding(.bottom, 0)
                        Text("AAA")
                            .font(.system(size: 36, weight: .black))
                    }
                    
                    ZStack {
                        Text("Машина")
                            .font(.system(size: 26, weight: .thin))
                            .opacity(isShowTranslate ? 1 : 0)
                        
                        Button {
                            withAnimation {
                                isShowTranslate.toggle()
                            }
                        } label: {
                            Text("Label")
                                .padding(.vertical, 13)
                                .padding(.horizontal, 60)
                            
                                .foregroundColor(.white)
                                .background(.green)
                                .clipShape(Capsule())
                        }
                        .opacity(isShowTranslate ? 0 : 1)
                    }
                }
                Spacer()
                Button {
                    //
                } label: {
                    HStack {
                        Text("Next")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(.green)
                }
                
                Rectangle()
                    .frame(height: 28)
                    .opacity(0)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct RandomWordView_Previews: PreviewProvider {
    static var previews: some View {
        RandomWordView()
    }
}
