import SwiftUI

@main
struct MyApp: App {
    
    var globalStates = GlobalStates()

    let orientationChanged = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
            .makeConnectable()
            .autoconnect()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
            .environmentObject(globalStates)
            .onReceive(orientationChanged) { _ in
                if UIDevice.current.orientation.isFlat {
                    
                } else {
                    globalStates.isLandScape = UIDevice.current.orientation.isLandscape
                }
            }
        }
    }
}
