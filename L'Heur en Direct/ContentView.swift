//
//  ContentView.swift
//  TESTE1
//
//  Created by Ronan Chenay on 20/07/2022.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: -  PROPERTY
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    // Current Time
    @State var currentDate: Date = Date()
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        // formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }
    
    // MARK: -  BODY
    var body: some View {
        NavigationView{
            
            ZStack {
                // background
                RadialGradient(
                    gradient: Gradient(colors: [Color.purple, Color.blue]),
                    center: .center,
                    startRadius: 5,
                    endRadius: 500)
                .ignoresSafeArea()
                
                // Foreground
                Text(dateFormatter.string(from: currentDate))
                    .font(.system(size: 60, weight: .semibold, design: .rounded))
                    .foregroundColor(.white)
                    .lineLimit(1)
                    .minimumScaleFactor(0.1)
                
                    .padding(.bottom,100)
                
                
                
                
                
            } //: ZSTACK
            .onReceive(timer) { value in
                currentDate = value
            }
            
            
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
