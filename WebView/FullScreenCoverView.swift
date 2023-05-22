//
//  FullScreenModalView.swift
//  WebView
//
//  Created by Rahmonali on 22/05/23.
//

import SwiftUI

struct FullScreenCoverView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var isLoading = true
    @State private var error: Error? = nil
    @State private var title = ""
    
    let url = URL(string: "https://google.com")
    
    var body: some View {
        NavigationView {
            VStack {
                if let error = error {
                    VStack {
                        Text("Error")
                        Text(error.localizedDescription)
                            .foregroundColor(.pink)
                        
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Text("Go back")
                        }
                    }
                    .padding()
                    
                } else if let url = url {
                    
                    if isLoading {
                        ProgressView()
                    }
                    WebView(url: url, title: $title, isLoading: $isLoading, error: $error)
                    
                } else {
                    Text("Sorry we could not load this url")
                }
            }
            .navigationTitle("\(title)")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Done") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

struct FullScreenModalView_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenCoverView()
    }
}
