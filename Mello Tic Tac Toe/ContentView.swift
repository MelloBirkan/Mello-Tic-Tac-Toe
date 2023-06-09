//
//  ContentView.swift
//  Mello Tic Tac Toe
//
//  Created by Marcello Gonzatto Birkan on 09/06/23.
//

import SwiftUI



struct ContentView: View {
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    @State var animate = false
    
    var body: some View {
        GeometryReader { geometry in
            
            ZStack {
                BackGroundView()
                    
                VStack {
                    Spacer()
                    LazyVGrid(columns: columns, spacing: 5) {
                        ForEach(0..<9) { i in
                            ZStack {
                                Circle()
                                    .foregroundColor(.white).opacity(0.7)
                                    .frame(width: geometry.size.width/3.1 - 15,
                                           height: geometry.size.width/3.1 - 15)
                                
                                Image(systemName: "xmark")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.white)
                            }
                            
                        }
                    }
                    Spacer()
                }
            }.padding()
                .background(
                    Color.black.gradient
                )
        }
    }
}

enum Player {
    case human, computer
}

struct Move {
    let player: Player
    let boardIndex: Int
    
    var indicator: String {
        return player == .human ? "xmark" : "circle"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BackGroundView: View {
    @State var animate = false
    
    var body: some View {
        CircleBackground(color: .blue)
            .blur(radius: animate ? 30 : 100)
            .offset(x: animate ? -50 : -130, y: animate ? -30 : -100)
            .task {
                withAnimation(.easeInOut(duration: 1).repeatForever()) {
                    animate.toggle()
                }
            }
        
        CircleBackground(color: Color.red)
            .blur(radius: animate ? 30 : 100)
            .offset(x: animate ? 100 : 130, y: animate ? 150 : 100)
    }
}
