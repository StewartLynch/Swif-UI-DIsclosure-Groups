//
// Created for DisclosureGroup List
// by Stewart Lynch on 2022-04-27
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import SwiftUI

struct DemoView: View {
    @State private var step1Expanded = true
    @State private var step2Expanded = false
    var body: some View {
        VStack {
            DisclosureGroup("Step 1", isExpanded: $step1Expanded) {
                VStack(alignment: .trailing) {
                    Text("This is the first step in learning about disclosure groups.")
                    Button("Next") {
                        Task {
                            withAnimation {
                                step1Expanded = false
                            }
                            try? await Task.sleep(nanoseconds: 250_000_000)
                            withAnimation {
                                step2Expanded = true
                            }
                        }
                    }
                }
            }
            .accentColor(.green)
            .padding()
            .background(RoundedRectangle(cornerRadius: 20)
                .fill(Color.green)
                .opacity(0.1)
            )
            DisclosureGroup(isExpanded: $step2Expanded) {
                VStack(alignment: .trailing) {
                    Text("This is the second step in learning about disclosure groups.")
                    Button("Previous") {
                        Task {
                            withAnimation {
                                step2Expanded = false
                            }
                            try? await Task.sleep(nanoseconds: 250_000_000)
                            withAnimation {
                                step1Expanded = true
                            }
                        }
                    }
                }
            } label: {
                Label("Step 2", systemImage: "lightbulb.fill")
            }
            .accentColor(.orange)
            .padding()
            .background(RoundedRectangle(cornerRadius: 20)
                .fill(Color.orange)
                .opacity(0.1)
            )
            Spacer()
        }
        .padding()
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
}
