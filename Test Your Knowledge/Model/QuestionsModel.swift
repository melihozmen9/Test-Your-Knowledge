//
//  QuestionsModel.swift
//  Test Your Knowledge
//
//  Created by Kullanici on 9.12.2022.
//

import Foundation

struct QuestionsModel {
    var questionNumber = 0
    var score = 0
    let questionArray = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
               Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
               Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
               Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
               Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
               Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
               Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
               Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
               Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
               Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    
    func getQuestion() -> String {
        return questionArray[questionNumber].questions // controller'daki updatelanen functaki soru.label'a buranın return'nunu atayacagız.
    }
 
    func getProgress() -> Float {
        return Float(questionNumber) / Float(questionArray.count - 1) // controller'daki progressLabel'ına buradaki return'u atayacagız.
    }
    
    mutating func nextQuestion(){ // bunu controller'daki action fonksiyonunun cevaplama işlemi bittikten sonra cagıracagız.
        if questionNumber < questionArray.count - 1 {
        questionNumber += 1
        } else {
            questionNumber = 0
            score = 0
        }
    }
    mutating func checkAnswer(userChoice: String) -> Bool{ // bu fonksiyonu oluştururken parametreli oluşturduk. parametre olarak contollerdaki sender.currentTitle'ı alacak.  yani tuşlanan butonu. Buton title'larına yukarıdaki quizin cevaplarını atadık sırasıyla. string olarak iki değeri kıyaslayacak.
        if userChoice == questionArray[questionNumber].correctAnswer { //  burada tuşlanan cevap parametreye atadık ve yukarıdaki array içindeki dogru cevapla kıyasladık.
            score += 1
            return true // geriye dogru dondurduk.
        } else {
            return false // geriye yanlış dondurduk.
        }
        
    }
}
