//
//  ResultViewController.swift
//  SwiftQuiz
//
//  Created by Thiago Correa on 01/05/2018.
//  Copyright © 2018 Thiago Correa. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var lbAnswered: UILabel!
    @IBOutlet weak var lbCorrect: UILabel!
    @IBOutlet weak var lbWrong: UILabel!
    @IBOutlet weak var lbScore: UILabel!
    
    var totalCorrectAnswers: Int  = 0
    var totalAnswers: Int = 0
    var score = 0
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbAnswered.text = "Perguntas Respondidas: \(totalAnswers)"
        lbCorrect.text = "Perguntas Corretas: \(totalCorrectAnswers)"
        lbWrong.text = "Perguntas Erradas: \(totalAnswers - totalCorrectAnswers)"
        
        if(totalAnswers > 0 ){
            self.score = totalCorrectAnswers * 100 / totalAnswers
            lbScore.text = "\(score)%"
        }else{
             lbScore.text = "\(score)%"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

}
