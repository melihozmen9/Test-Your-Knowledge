//
//  Questions.swift
//  Test Your Knowledge
//
//  Created by Kullanici on 9.12.2022.
//

import Foundation
struct Question {
    let questions : String
    let answers : [String]
    let correctAnswer : String
    
    init(q: String,a:[String],correctAnswer:String) {
        questions = q
        answers = a
        self.correctAnswer = correctAnswer
    }
}
