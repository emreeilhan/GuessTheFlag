//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Emre Ilhan on 20.06.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = [
        "Estonia",
        "France",
        "Germany",
        "Ireland",
        "Italy",
        "Nigeria",
        "Poland",
        "Spain",
        "UK",
        "Ukraine",
        "US"
    ].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var isAlertShowing = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color.black,Color.blue,Color.white], startPoint: .init(x: 0.5, y: 0.65), endPoint: .top).ignoresSafeArea(.all)
            VStack{
                Spacer()
                Text("Guess the flag")
                    .font(.largeTitle.bold())
                VStack(spacing: 18) {
                    VStack{
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<3){ number in
                        Button{
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                        }
                    }.clipShape(.capsule)
                }
                .alert(scoreTitle, isPresented: $isAlertShowing) {
                    Button("Continue",action: askQuestions)
                } message: {
                    Text("Your score is \(score)")
                }
                
                .frame(maxWidth: .infinity)
                .padding(.vertical,20)
                .background(.ultraThinMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                Text("Score is: \(score) ")
                    .foregroundStyle(.white)
                    .font(.title.weight(.bold))
                Spacer()
            }
        }
    }
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            score += 1
            scoreTitle = "Correct"
        } else {
            score -= 1
            scoreTitle = "Wrong"
        }
        isAlertShowing = true
    }
    func askQuestions(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}




#Preview {
    ContentView()
}
