//
//  HomeList.swift
//  SwiftUIPlayground
//
//  Created by Laurent Catalina on 08/07/2019.
//  Copyright © 2019 Laurent Droguet. All rights reserved.
//

import SwiftUI

struct HomeList : View {
    let courses = coursesData
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Courses").font(.largeTitle).fontWeight(.heavy)
                    Text("22 courses").color(Color.gray)
                }
                Spacer()
            }
            .padding(.leading, 70.0)
                .padding(.bottom, 40)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30){
                    ForEach(courses) { item in
                        ZStack {
                            CourseView(data: item)
                            PresentationLink("LINK", destination: ContentView())
                        }
                    }
                }.padding(.leading, 40)
            }
        }
    }
}

#if DEBUG
struct HomeList_Previews : PreviewProvider {
    static var previews: some View {
        HomeList()
    }
}
#endif

struct CourseView : View {
    var data: Course
    
    var body: some View {
        return VStack (alignment: .leading){
            Text(data.title)
                .font(.title)
                .fontWeight(.bold)
                .color(.white)
                .padding(30)
                .lineLimit(4)
                .padding(.trailing, 50)
            Spacer()
            Image(data.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 246, height: 200)
                .padding(.bottom, 30)
        }
        .background(data.color)
            .cornerRadius(30)
            .frame(width: 246, height: 360)
            .shadow(color: data.shadowColor, radius: 20, x: 0, y: 20)
    }
}

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var image: String
    var color: Color
    var shadowColor: Color
}

let coursesData = [
    Course(title: "Build an app with SwiftUI",
           image: "Illustration1",
           color: Color("background3"),
           shadowColor: Color("backgroundShadow3")),
    Course(title: "Design Course",
           image: "Illustration2",
           color: Color("background4"),
           shadowColor: Color("backgroundShadow4"))
]
