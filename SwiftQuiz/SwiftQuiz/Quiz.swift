//
//  Quiz.swift
//  SwiftQuiz
//
//  Created by Thiago Correa on 01/05/2018.
//  Copyright © 2018 Thiago Correa. All rights reserved.
//

import Foundation

class Quiz{
    
    let question: String
    let options: [String]
    private let correctAnswer: String
    
    init(question: String, options: [String], correctAnswer: String) {
        self.question = question
        self.options = options
        self.correctAnswer = correctAnswer
    }
    
    func validateOption(_ index: Int ) -> Bool{
        let answer = options[index]
        return answer == correctAnswer
    }
    
    deinit {
        print("Liberou quiz da memoria")
    }
    
}
