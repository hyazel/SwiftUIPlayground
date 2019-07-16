//
//  ContentView.swift
//  SwiftUIPlayground
//
//  Created by Laurent Catalina on 03/07/2019.
//  Copyright © 2019 Laurent Droguet. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State var show = false
    @State var viewState = CGSize.zero
    
    var body: some View {
        ZStack {
            BlurView(style: .systemMaterial)
            
            TitleView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)
            CardBottomView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)
            
            CardView()
                .offset(x: 0, y: -40)
                .scaleEffect(0.85)
                .rotationEffect(Angle(degrees: show ? 15 : 0))
//                .rotation3DEffect(Angle(degrees: show ? 50 : 0), axis: (x: 10.0, y: 10.0, z: 10.0))
                .blendMode(.hardLight)
                .animation(.basic(duration: 0.5, curve: .easeInOut))
                .offset(x: viewState.width, y: viewState.height)
            
            CardView()
                .offset(x: 0, y: -20)
                .scaleEffect(0.9)
                .rotationEffect(Angle(degrees: show ? 10 : 0))
//                .rotation3DEffect(Angle(degrees: show ? 40 : 0), axis: (x: 10.0, y: 10.0, z: 10.0))
                .blendMode(.hardLight)
                .animation(.basic(duration: 0.5, curve: .easeInOut))
                .offset(x: viewState.width, y: viewState.height)
            
            CertificateView()
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: show ? 5 : 0))
//                .rotation3DEffect(Angle(degrees: show ? 30 : 0), axis: (x: 10.0, y: 10.0, z: 10.0))
                .animation(.spring())
                .tapAction {
                    self.show.toggle()
                }
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            self.viewState = value.translation
                            self.show = true
                        }).onEnded({ value in
                            self.viewState = .zero
                            self.show = false
                        })
            )
            
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.colorScheme, .dark)
    }
}
#endif

struct CardView : View {
    var body: some View {
        return VStack {
            Text("Card Back")
            }
            .frame(width: 340.0, height: 220.0)
            .background(Color.blue)
            
            .cornerRadius(10)
            .shadow(radius: 20)
    }
}

struct CertificateView : View {
    var body: some View {
        return VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("UI Design")
                        .font(.headline)
                        .color(Color("accent"))
                        .fontWeight(.bold)
                        .padding(.top)
                    Text("Certificate")
                        .color(.white)
                }
                Spacer()
                Image("Logo")
                    .resizable()
                    .frame(width: 30.0, height: 30.0)
                }
                .padding(.horizontal)
            Spacer()
            Image("Background")
            }
            .frame(width: 340.0, height: 220.0)
            .background(Color.black)
            .cornerRadius(10)
            .shadow(radius: 20)
    }
}

struct TitleView : View {
    var body: some View {
        return VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Spacer()
            }
            Image("Illustration5")
            Spacer()
            }
            .padding()
    }
}

struct CardBottomView : View {
    var body: some View {
        return VStack(spacing: 20.0) {
            Rectangle()
                .frame(width: 60, height: 6)
                .cornerRadius(3.0)
                .opacity(0.1)
            Text("This certificate is proof that LD has achieved the UID Design course with approval")
                .lineLimit(10)
            Spacer()
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .padding(.horizontal)
            .background(BlurView(style: .systemMaterial))
            .cornerRadius(30)
            .shadow(radius: 20.0)
            .offset(x: 0, y: 600)
    }
}
