//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Horst Josef Grenz Meza on 2/7/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

enum QuestionType{
    case multipleChoice
    case true_false
}

struct Question{
    let title : String;
    let options: [String];
    let type : QuestionType;
    let correctAnswer: String
    
    init(q: String,questionType t: QuestionType = QuestionType.true_false,a options: [String] = ["True","False"],correctAnswer cA:String){
        self.title = q
        self.options = options
        if options.count > 2 {
            self.type = QuestionType.multipleChoice
        }else{
            self.type = t
        }
        self.correctAnswer = cA
    }
    func getAnswer()->String{
        return self.correctAnswer
    }
}
