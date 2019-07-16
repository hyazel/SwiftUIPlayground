//
//  TabBar.swift
//  SwiftUIPlayground
//
//  Created by Laurent Catalina on 09/07/2019.
//  Copyright © 2019 Laurent Droguet. All rights reserved.
//

import SwiftUI

struct TabBar : View {
    var body: some View {
        TabbedView(selection: .constant(1)) {
            Home().tabItem {
                VStack {
                    Image("IconHome")
                    Text("Home")
                }
            }.tag(1)
            
            ContentView().tabItem {
                VStack {
                    Image("IconCards")
                    Text("Certificates")
                }
            }.tag(2)
            
            UpdateList().tabItem {
                VStack {
                    Image("IconSettings")
                    Text("Updates")
                }
            }.tag(3)
        }
    }
}

#if DEBUG
struct TabBar_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            TabBar()
            TabBar().environment(\.colorScheme, .dark)
        }
        
    }
}
#endif
