//
//  ContentView.swift
//  ScrollingViewReader
//  Created by Sumit on 10/08/24.

import SwiftUI

struct HorizontalListView: View {
    
    @Namespace var topID
    @Namespace var bottomID

    var body: some View   {
        ZStack {
            ScrollViewReader { proxy in
                Button(action: {
                    withAnimation {
                        proxy.scrollTo(bottomID)
                    }
                }, label: {
                    Text("Scroll to last Item")
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .padding()
                        .background(.red)
                        .cornerRadius(15)
                })
                .padding([.top,.bottom], 50)
                
                ScrollView(.horizontal ,showsIndicators: false) {
                    HStack(spacing: 20) {
                            ForEach(0..<20) { index in
                                ZStack {
                                    Image("Bg_image_One")
                                        .resizable()
                                        .frame(width: 300, height: 300)
                                        .cornerRadius(20)
                                    HStack {
                                        Text("Count of Row = \(index)")
                                            .foregroundStyle(.white)
                                            .font(.system(size: 24, weight: .bold, design: .default))
                                            .frame(width:220)
                                    }
                                }
                            }
                            .padding([.leading,.trailing],5)
                    }
                    .id(bottomID)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    HorizontalListView()
}
