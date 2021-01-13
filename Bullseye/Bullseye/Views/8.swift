//
//  ContentView.swift
//  Bullseye
//
//  Created by P.M. Student on 1/5/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible = false
    
    @State private var sliderValue = 50.0
    
    @State private var game = Game()

    var body: some View {
        
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack { 
                    Text("🎯🎯🎯\nPut the bulleyes as close as you can to".uppercased())
                            .bold()
                            .kerning(2.0)
                            .multilineTextAlignment(.center)
                            .lineSpacing(4.0)
                            .font(.footnote)
                            .padding(.leading, 30.0)
                            .padding(.trailing, 30.0)
                            .foregroundColor(Color("TextColor"))
                   

                    Text(String(game.target))
                            .kerning(-1.0)
                            .font(.largeTitle)
                            .fontWeight(.black)
                            .foregroundColor(Color("TextColor"))
                    
                    HStack {
                        Text("1")
                        .bold()
                        .foregroundColor(Color("TextColor"))
                        Slider(value: $sliderValue,  in: 1.0...100.0)
                        Text("100")
                            .bold()
                            .foregroundColor(Color("TextColor")) 
                        
                    }
                    .padding()
                    Button(action: {
                        print("Hello, SwiftUI!")
                        alertIsVisible = true
                    }) {
                        Text("Hit me".uppercased())
                        .bold()
                        .font(.title3)                }
                    .padding(20.0)
                    .background(ZStack {
                        Color("ButtonColor")
                        LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
                    }
                    )
                    .foregroundColor(.white)
                    .cornerRadius(21.0)
                  
                    .alert(isPresented: $alertIsVisible, content: {
                        let roundedValue: Int = Int(sliderValue.rounded())
                        return Alert(title: Text("Hello there"), message: Text("The slider's value is \(roundedValue).\n" + "You Scored \(game.points(sliderValue: roundedValue)) points this round." ), dismissButton: .default(Text("Awesome!")))
                    })
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
        
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}