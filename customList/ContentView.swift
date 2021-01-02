
import SwiftUI

struct ListData: Identifiable,Hashable {
    var id = UUID()
    var title: String
    var postType: Array<String>
    var date: String
    var Image: String
    var Color: Color
    var percentage: GLfloat
}



var data = [
    ListData(title: "LazyHGrid in SwiftUI (part 1/3)", postType: ["iOS","SwiftUI", "Xcode"], date: "05 Jun", Image: "LazyGrid",Color: Color.lighterPink, percentage: 0.30),
    ListData(title: "LazyHGrid and LazyVGrid in SwiftUI ", postType: ["iOS","SwiftUI", "Xcode"], date: "15 dec", Image: "LazyGrid2",Color: Color.lighterGray, percentage: 0.25),
    ListData(title: "How to Detect Light/Dark theme", postType: ["iOS","SwiftUI", "Xcode"], date: "20 Nov", Image: "themeDetector",Color: Color.lightOrange, percentage: 0.10),
    ListData(title: "Gradient Color in SWiftUI", postType: ["iOS","SwiftUI", "Xcode"], date: "10 Jun", Image: "try1",Color: Color.lightPink, percentage: 0.45),
    ListData(title: "How to Detect Light/Dark theme", postType: ["iOS","SwiftUI", "Xcode"], date: "05 Feb", Image: "themeDetector",Color: Color.lightGray, percentage: 0.86),
    ListData(title: "LazyHGrid in SwiftUI (part 1/3)", postType: ["iOS","SwiftUI", "Xcode"], date: "15 Dec", Image: "LazyGrid",Color: Color.lightOrange, percentage: 0.30),
    ListData(title: "LazyHGrid and LazyVGrid in SwiftUI ", postType: ["iOS","SwiftUI", "Xcode"], date: "15 dec", Image: "LazyGrid2",Color: Color.lighterPink, percentage: 0.25),
    ListData(title: "How to Detect Light/Dark theme", postType: ["iOS","SwiftUI", "Xcode"], date: "15 dec", Image: "themeDetector",Color: Color.lighterGray, percentage: 0.10),
    ListData(title: "Gradient Color in SWiftUI", postType: ["iOS","SwiftUI", "Xcode"], date: "15 dec", Image: "try1",Color: Color.lightGray, percentage: 0.45),
    ListData(title: "How to Detect Light/Dark theme", postType: ["iOS","SwiftUI", "Xcode"], date: "15 dec", Image: "themeDetector",Color: Color.lightOrange, percentage: 0.86)
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

//blurrybackground

extension Color {
    static let textColor = Color(red: 235 / 255, green: 235 / 255, blue: 235 / 255)
    static let subtextColor = Color(red: 199 / 255, green: 199 / 255, blue: 199 / 255)
}

struct blurTags:  View {
    
    var tags: Array<String>
    
    var body: some View {
        HStack {
            ForEach(tags, id: \.self) { tag in
                Text("\(tag)")
                    .fontWeight(.semibold)
                    .foregroundColor(.subtextColor)
                    .font(.caption)
            }
        }
    }
}

struct BlurView: UIViewRepresentable {
    
    let style: UIBlurEffect.Style
    
    func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 0)
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
        return view
    }
    
    func updateUIView(_ uiView: UIView,
                      context: UIViewRepresentableContext<BlurView>) {
        
    }
    
}

struct Stars: View {
    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: "star.fill")
                .foregroundColor(Color.yellow)
                .font(.caption)
            Image(systemName: "star.fill")
                .foregroundColor(Color.yellow)
                .font(.caption)
            Image(systemName: "star.fill")
                .foregroundColor(Color.yellow)
                .font(.caption)
            Image(systemName: "star.fill")
                .foregroundColor(Color.white)
                .font(.caption)
            Image(systemName: "star.fill")
                .foregroundColor(Color.white)
                .font(.caption)
        }
    }
}

struct smallcardView: View {
    
    var p: ListData
    
    var body: some View {
        GeometryReader { g in
            VStack(alignment: .leading) {
                HStack {
                    Image(p.Image)
                        .resizable()
                        .frame(width: 120, height: 90)
                        .cornerRadius(10)
                    Spacer()
                    VStack(alignment: .leading) {
                        blurTags(tags: p.postType)
                        Spacer()
                        Text(p.title)
                            .foregroundColor(Color.textColor)
                        Spacer()
                        HStack {
                            Stars()
                            Text("(100)")
                                .font(.caption2)
                                .foregroundColor(.subtextColor)
                        }
                    }
                    Spacer()
                    VStack {
                        Image(systemName: "ellipsis")
                            .foregroundColor(Color.white)
                        Spacer()
                    }
                }
            }
            
        }
    }
}

struct bigcardView: View {
    var p: ListData
    
    var body: some View {
        GeometryReader { g in
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Image(p.Image)
                        .resizable()
                        .frame(width: g.size.width / 1.2, height: 160)
                        .cornerRadius(10)
                    Spacer()
                    VStack(alignment: .leading) {
                        HStack {
                            blurTags(tags: p.postType)
                            Spacer()
                            Image(systemName: "ellipsis")
                                .foregroundColor(Color.white)
                        }
                        
                        Spacer()
                        Text(p.title)
                            .foregroundColor(Color.textColor)
                        Spacer()
                        HStack {
                            Stars()
                            Text("(100)")
                                .font(.caption2)
                                .foregroundColor(.subtextColor)
                        }
                    }
                    Spacer()
                    VStack {
                        
                        Spacer()
                    }
                }
            }
        }
    }
}



struct BlurryBackGroundView: View {
    
    @State var small = true
    
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
                    ForEach(data, id: \.self) { p in
                        if small {
                            smallcardView(p: p)
                                .padding()
                                .frame(width: g.size.width / 1.1, height: 120)
                                .background(BlurView(style: .light))
                                .cornerRadius(10)
                                .padding(.vertical,6)
                                .onLongPressGesture {
                                    withAnimation {
                                        small.toggle()
                                    }
                                }
                        } else {
                            bigcardView(p: p)
                                .padding()
                                .frame(width: g.size.width / 1.1, height: 270)
                                .background(BlurView(style: .light))
                                .cornerRadius(10)
                                .padding(.vertical,6)
                                .onLongPressGesture {
                                    withAnimation {
                                        self.small.toggle()
                                    }
                                }
                        }
                        
                    }
                }.frame(width: g.size.width)
            }
        }
    }
}

// ----------------- No Space List ---------------
extension Color {
    static let lightPink = Color(red: 236 / 255, green: 188 / 255, blue: 180 / 255)
    static let lightGray = Color(red: 224 / 255, green: 229 / 255, blue: 236 / 255)
    static let lightOrange = Color(red: 219 / 255, green: 98 / 255, blue: 68 / 255)
    static let iconGray = Color(red: 112 / 255, green: 112 / 255, blue: 112 / 255)
    static let lighterPink = Color(red: 233 / 255, green: 219 / 255, blue: 210 / 255)
    static let lighterGray = Color(red: 214 / 255, green: 214 / 255, blue: 214 / 255)
}

struct nospaceTags: View {
    
    var tags: Array<String>
    
    var body: some View {
        HStack {
            ForEach(tags, id: \.self) { tag in
                Text("\(tag)")
                    .font(.footnote)
                    .fontWeight(.bold)
                    .padding(.vertical, 2)
            }
        }
    }
}

struct NoSpaceList: View {
    var body: some View {
        GeometryReader { g in
            ScrollView {
                HStack {
                    Image(systemName: "square.grid.3x3.fill")
                        .font(.title3)
                    Spacer()
                    Text("The Happy Programmer")
                        .font(.title3)
                    Spacer()
                    Image(systemName: "magnifyingglass")
                        .font(.title3)
                }.padding().ignoresSafeArea()
                
                VStack {
                    ForEach(data) { post in
                        HStack{
                            HStack(alignment: .firstTextBaseline) {
                                VStack(alignment: .leading) {
                                    Text(post.title)
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                    nospaceTags(tags: post.postType)
                                    Spacer()
                                    Divider().frame(height: 0.5).background(Color.black)
                                    HStack {
                                        Text("Post Updated")
                                            .font(.caption)
                                        Spacer()
                                        Text(post.date)
                                            .font(.caption)
                                    }.padding(.bottom, 20)
                                }.padding(.top, 30)
                                
                                Image(systemName: "arrow.right")
                                    .foregroundColor(.iconGray)
                                    .font(.largeTitle)
                            }
                            .padding(.horizontal)
                            
                            
                        }
                        .frame(width: g.size.width, height: g.size.height / 2.5)
                        .background(post.Color)
                    }
                }
            }.frame(width: g.size.width, height: g.size.height)
        }
    }
}

struct ContentView: View {
    var body: some View {
        NoSpaceList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
