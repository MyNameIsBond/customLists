
import SwiftUI

struct ListData: Identifiable {
    var id = UUID()
    var title: String
    var postType: Array<String>
    var date: String
    var Image: String
    var Color: Color
}


 


var data = [
    ListData(title: "LazyHGrid in SwiftUI", postType: ["iOS","SwiftUI", "Xcode"], date: "15 dec", Image: "LazyGrid",Color: Color.red),
    ListData(title: "LazyHGrid and LazyVGrid in SwiftUI ", postType: ["iOS","SwiftUI", "Xcode"], date: "15 dec", Image: "LazyGrid2",Color: Color.red),
    ListData(title: "How to Detect Light/Dark theme", postType: ["iOS","SwiftUI", "Xcode"], date: "15 dec", Image: "themeDetector",Color: Color.green),
    ListData(title: "Gradient Color", postType: ["iOS","SwiftUI", "Xcode"], date: "15 dec", Image: "try1",Color: Color.red)
]

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(data) { m in
                VStack(Spacing: 20) {
                    NavigationLink(destination: Text(m.title)) {
                        HStack{
                            Image(m.Image)
                                .resizable()
                                .frame(width: 120, height: 150)
                            VStack {
                                
                                    Text("Lol")
                                        .foregroundColor(m.Color)
                                        .font(.caption2)
                                        .padding(5)
                                        .overlay(
                                           RoundedRectangle(cornerRadius: 10)
                                            .stroke(m.Color, lineWidth: 1)
                                       )
                                
                            }
                        }
                    }.frame(height: 170)
                }
            }.listStyle(SidebarListStyle())
            .navigationTitle("Post List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
