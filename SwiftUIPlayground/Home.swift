//
//  Home.swift
//  SwiftUIPlayground
//
//  Created by Laurent Catalina on 03/07/2019.
//  Copyright © 2019 Laurent Droguet. All rights reserved.
//

import SwiftUI

struct Home : View {
    @State var show = false
    @State var showProfile = false
    
    var body: some View {
        ZStack {
            VStack {
                HomeList()
                    .blur(radius:  show ? 20 : 0)
                    .scaleEffect(show ? 0.95 : 1)
                    .animation(.default)
                
                Spacer()
            }.padding(.top, 78)
            
            ContentView()
                .cornerRadius(30)
                .shadow(radius: 20)
                .animation(.fluidSpring())
                .offset(y: showProfile ? 40 : UIScreen.main.bounds.height)
            
            MenuButton(show: $show)
                .offset(x: -30, y: showProfile ? 0 : 80)
                .animation(.spring())
            
            MenuRight(show: $showProfile)
                .offset(x: -16, y: showProfile ? 0 : 88)
                .animation(.spring())
            
            MenuView(show: $show)
        }
    }
}

#if DEBUG
struct Home_Previews : PreviewProvider {
    static var previews: some View {
        Home()
    }
}
#endif

struct MenuRow : View {
    var image = "creditcard"
    var text = "My Account"
    
    var body: some View {
        return HStack {
            Image(systemName: image)
                .imageScale(.large)
                .foregroundColor(Color("icons"))
                .frame(width: 32, height: 32)
                Text(text)
                    .font(.headline)
            Spacer()
            }
        }
    }

struct Menu: Identifiable {
    var id = UUID()
    var title: String
    var icon: String
}

let menuData = [
    Menu(title: "My Account", icon: "person.crop.circle"),
    Menu(title: "Billing", icon: "creditcard"),
    Menu(title: "Team", icon: "person.and.person"),
    Menu(title: "Sign out", icon: "arrow.uturn.down")
]

struct MenuView : View {
    var menu = menuData
    @Binding var show: Bool
    @State var position = CGSize.zero
    var body: some View {
        return VStack(alignment: .leading, spacing: 20) {
            ForEach(menu) { item in
                MenuRow(image: item.icon, text: item.title)
            }
            Spacer()
        }
        .padding(.top, 20)
        .padding(30)
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .padding(.trailing, 60)
        .shadow(radius: 20)
        .animation(.basic())
        .offset(x: show ? 0 : -UIScreen.main.bounds.width, y: 0)
        .tapAction {
            self.show.toggle()
        }
    }
}

struct CircleButton : View {
    var icon = "person.crop.circle"
    
    var body: some View {
        return HStack {
            Image(systemName: icon).foregroundColor(Color.black)
        }
        .frame(width: 44, height: 44)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
}
}

struct MenuButton : View {
    @Binding var show: Bool
    
    var body: some View {
        return ZStack(alignment: .topLeading) {
            Button(action: {
                self.show.toggle()
            }) {
                HStack {
                    Spacer()
                    Image(systemName: "list.dash").foregroundColor(Color.black)
                }
                .padding(.trailing, 20)
                .frame(width: 90, height: 60)
                .background(Color.white)
                .cornerRadius(30)
                .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
        }
        
        Spacer()
    }
}
}

struct MenuRight : View {
    @Binding var show: Bool
    var body: some View {
        return ZStack(alignment: .topTrailing) {
            HStack {
                Button(action: { self.show.toggle() }) {
                    CircleButton(icon: "person.crop.circle")
                }
                Button(action: { self.show.toggle() }) {
                    CircleButton(icon: "bell")
                }
            }
            
            Spacer()
        }
    }
}
