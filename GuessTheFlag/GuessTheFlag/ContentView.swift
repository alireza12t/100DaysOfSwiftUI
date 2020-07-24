//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by ali on 7/21/20.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = [
        "Estonia",
        "Germany",
        "Ireland",
        "France",
        "Italy",
        "Russia",
        "Nigeria",
        "Poland",
        "Spain",
        "UK",
        "US"
    ].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score: Int = 0
    
    @State private var showingScore: Bool = false
    @State private var scoreTitle: String = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 30) {
            VStack {
                Text("Tap the flag of")
                
                Text(countries[correctAnswer])
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.black)
            }
            
            ForEach(0 ..< 3){ number in
                Button( action: {
                    flagDidTap(number)
                }){
                    Image(self.countries[number])
                        .renderingMode(.original)
                        .clipShape(Capsule())
                        .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                        .shadow(color: .black, radius: 2)
                }
                .alert(isPresented: $showingScore) {
                    Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")){
                        askQuestion()
                    })
                }
            }
                
                Text("Score : \(score)")
                    .foregroundColor(.white)
                Spacer()
            }
        }
    }
    
    func flagDidTap(_ number: Int){
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong! Thats the flag of \(countries[number])"
            score -= 1
        }
        
        showingScore = true
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
