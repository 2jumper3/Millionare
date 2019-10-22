//
//  ContentView.swift
//  Millionare
//
//  Created by Sergey on 21.10.2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
        VStack {
            Text("Hello World").font(.system(size: 30))
            Text("Welcome to Millionare Game")
            NavigationLink(destination: questionView()) {
                   ButtonView()
               }
            }
            .navigationBarTitle("First")
            .navigationBarHidden(true)
        }
            
}}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ButtonView: View {
var body: some View {
    Text("Start Game")
        .frame(width: 200, height: 100, alignment: .center)
        .background(Color.white)
        .foregroundColor(Color.red)
}
}
