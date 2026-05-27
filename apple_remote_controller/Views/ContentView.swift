import SwiftUI

struct ContentView: View {
    @State private var highlightedInputs: Set<ControllerInput> = [.buttonA, .rightStick]

    var body: some View {
        NavigationSplitView {
            SidebarView(highlightedInputs: $highlightedInputs)
                .navigationSplitViewColumnWidth(min: 220, ideal: 260)
        } detail: {
            MainControllerView(highlightedInputs: $highlightedInputs)
        }
    }
}

#Preview {
    ContentView()
}
