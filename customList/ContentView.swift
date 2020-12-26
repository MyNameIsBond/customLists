
import SwiftUI

struct ListData: Identifiable {
    var id = UUID()
    var title: String
    var postType: Array<String>
    var date: String
    var Image: String
    var Color: Color
    var percentage: GLfloat
}



var data = [
    ListData(title: "LazyHGrid in SwiftUI", postType: ["iOS","SwiftUI", "Xcode"], date: "15 dec", Image: "LazyGrid",Color: Color.red, percentage: 0.30),
    ListData(title: "LazyHGrid and LazyVGrid in SwiftUI ", postType: ["iOS","SwiftUI", "Xcode"], date: "15 dec", Image: "LazyGrid2",Color: Color.red, percentage: 0.25),
    ListData(title: "How to Detect Light/Dark theme", postType: ["iOS","SwiftUI", "Xcode"], date: "15 dec", Image: "themeDetector",Color: Color.green, percentage: 0.10),
    ListData(title: "Gradient Color in SWiftUI", postType: ["iOS","SwiftUI", "Xcode"], date: "15 dec", Image: "try1",Color: Color.red, percentage: 0.45),
    ListData(title: "How to Detect Light/Dark theme", postType: ["iOS","SwiftUI", "Xcode"], date: "15 dec", Image: "themeDetector",Color: Color.green, percentage: 0.86),
    ListData(title: "LazyHGrid in SwiftUI", postType: ["iOS","SwiftUI", "Xcode"], date: "15 dec", Image: "LazyGrid",Color: Color.red, percentage: 0.30),
    ListData(title: "LazyHGrid and LazyVGrid in SwiftUI ", postType: ["iOS","SwiftUI", "Xcode"], date: "15 dec", Image: "LazyGrid2",Color: Color.red, percentage: 0.25),
    ListData(title: "How to Detect Light/Dark theme", postType: ["iOS","SwiftUI", "Xcode"], date: "15 dec", Image: "themeDetector",Color: Color.green, percentage: 0.10),
    ListData(title: "Gradient Color in SWiftUI", postType: ["iOS","SwiftUI", "Xcode"], date: "15 dec", Image: "try1",Color: Color.red, percentage: 0.45),
    ListData(title: "How to Detect Light/Dark theme", postType: ["iOS","SwiftUI", "Xcode"], date: "15 dec", Image: "themeDetector",Color: Color.green, percentage: 0.86)
]

extension Color {
    static let pinkColor = Color(red: 227 / 255, green: 133 / 255, blue: 180 / 255)
    static let purpleColor = Color(red: 123 / 255, green: 119 / 255, blue: 233 / 255)
    static let OrangeColor = Color(red: 240 / 255, green: 146 / 255, blue: 171 / 255)
}

struct tags: View {
    var tags: Array<String>
    var body: some View {
        HStack {
        ForEach(tags, id: \.self) { e in
            Text(e)
                .foregroundColor(.pinkColor)
                .font(.system(size: 6))
                .padding(4)
                .overlay(
                   RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.pinkColor, lineWidth: 0.5)
               )
           }
        }
    }
}

struct simpleListView: View {
    var body: some View {
        NavigationView {
            List(data) { m in
                VStack {
                    NavigationLink(destination: Text(m.title)) {
                        HStack{
                            Image(m.Image)
                                .resizable()
                                .frame(width: 120, height: 90)
                            VStack(alignment: .leading, spacing: 8) {
                                tags(tags: m.postType)
                                Text(m.title)
                                    .bold()
                                    .font(.subheadline)
                                    .lineLimit(1)
                                Text("The Happy Programmer")
                                    .font(.caption2)
                                    .foregroundColor(Color.gray)
                                HStack {
                                    ProgressView(value: m.percentage)
                                        .progressViewStyle(LinearProgressViewStyle(tint: Color.pinkColor))
                                        .foregroundColor(Color.red)
                                    Text(String(format: "%.0f%%", m.percentage * 100))
                                        .font(.caption2)
                                        .foregroundColor(Color.gray)
                                    
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Post List")
        }
    }
}

// Blurry back ground Cards --------------------------------------
struct BlurryBackGroundView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.pinkColor, Color.purpleColor]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
            VStack {
                Capsule()
                    .fill(Color.OrangeColor)
                    .frame(width: 200, height: 200)
                    .offset(x: -150, y: -55)
                Spacer()
                Capsule()
                    .fill(Color.OrangeColor)
                    .frame(width: 200, height: 200)
                    .offset(x: 150, y: 105)
            }
            
            GeometryReader { g in
                
                ScrollView {
                    VStack {
                        HStack {
                            Image(systemName: "text.justify")
                                .font(.title3)
                                .foregroundColor(Color.white)
                            Spacer()
                            Image("logo")
                                .resizable()
                                .frame(width: 130, height: 40)
                            Spacer()
                            Image(systemName: "bell")
                                .font(.title2)
                                .foregroundColor(Color.white)
                        }.padding(.horizontal)
                    }
                    ForEach(data) { p in
                        VStack {
                            HStack {
                                Image(p.Image)
                                    .resizable()
                                    .frame(width: 120, height: 90)
                                    .cornerRadius(10)
                                VStack {
                                    Text(p.title)
                                }
                            }
                        }.padding(.all).frame(width: g.size.width / 1.1).background(Color.black.opacity(0.3))
                        .cornerRadius(10)
                    }
                }.frame(width: g.size.width)
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        BlurryBackGroundView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
