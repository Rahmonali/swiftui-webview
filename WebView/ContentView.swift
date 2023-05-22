//
//  ContentView.swift
//  WebView
//
//  Created by Rahmonali on 11/04/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isShowingFullScreen = false
    @State var isShowingAlert = false
    
    var body: some View {
        
        VStack {
            Button {
                isShowingFullScreen = true
            } label: {
                Text("Open Web Page")
                
            }
            .fullScreenCover(isPresented: $isShowingFullScreen) {
                isShowingAlert = true
            } content: {
                FullScreenCoverView()
            }
        }
        .alert(isPresented: $isShowingAlert) {
            Alert(
                title: Text("Title"),
                message: Text("Message"),
                dismissButton: .default(Text("OK"), action: {})
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
