import SwiftUI

struct TriviaView: View {
    @State var universalSize = UIScreen.main.bounds
    
    @State private var pageIndex = 1
    private let trivias: [Trivia] = Trivia.all
    private let dotAppearance = UIPageControl.appearance()
    
    @EnvironmentObject var globalStates: GlobalStates
    
    var body: some View {
        ZStack {
            Color(red: 127/255, green: 178/255, blue: 109/255)
                .ignoresSafeArea()
            
            if globalStates.isLandScape {
                getSinWave()
                    .foregroundColor(.white)
            } else {
                getSinWave()
                    .foregroundColor(.white)
            }
            
            VStack {
                HStack {
                    Text("Did you know that...")
                        .font(globalStates.getFont(weight: "Bold", size: 66))
                        .foregroundColor(.white)
                        .padding(.top, 100)
                    Spacer()
                }
                
                Spacer()
            } .padding()
            
            TabView(selection: $pageIndex) {
                ForEach(trivias, id: \.id) { trivia in
                    VStack {
                        Spacer()
                        TriviaAdapter(trivia: trivia)
                        
                        if (trivia == trivias.last) {
                            Button(action: goToFirst) {
                                Text("Go to First")
                                    .padding()
                                    .background(Color(red: 127/255, green: 178/255, blue: 109/255))
                                    .cornerRadius(15)
                                    .foregroundColor(.white)
                                    .font(globalStates.getFont(weight: "Regular", size: 24))
                            }
                            .padding(.bottom, 200)
                        } else {
                            Button(action: incrementPage) {
                                Text("Next")
                                    .padding()
                                    .background(Color(red: 127/255, green: 178/255, blue: 109/255))
                                    .cornerRadius(15)
                                    .foregroundColor(.white)
                                    .font(globalStates.getFont(weight: "Regular", size: 24))
                            }
                            .padding(.bottom, 200)
                        }
                        
                        Spacer()
                    }
                    .tag(trivia.id)
                }
            }
            .animation(.easeInOut, value: pageIndex)
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .interactive))
            .onAppear {
                dotAppearance.currentPageIndicatorTintColor = UIColor(Color(red: 220/255, green: 101/255, blue: 32/255))
                dotAppearance.pageIndicatorTintColor = .gray
            }
        }
    }
    
    func incrementPage() {
        pageIndex += 1
    }
    
    func goToFirst() {
        pageIndex = 1
    }
    
    func getSinWave(baseline: CGFloat = UIScreen.main.bounds.height * 0.5) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 0, y: baseline))
            path.addCurve(
                to: CGPoint(x: UIScreen.main.bounds.width, y: baseline),
                control1: CGPoint(x: UIScreen.main.bounds.width * (0.25), y: 300 + baseline),
                control2: CGPoint(x: UIScreen.main.bounds.width * (0.75), y: -300 + baseline)
            )
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: UIScreen.main.bounds.height))
            path.addLine(to: CGPoint(x: 0, y: UIScreen.main.bounds.height))
        }
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView().environmentObject(GlobalStates())
    }
}
