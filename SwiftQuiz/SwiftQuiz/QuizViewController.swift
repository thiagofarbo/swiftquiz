//
//  QuizViewController.swift
//  SwiftQuiz
//
//  Created by Thiago Correa on 01/05/2018.
//  Copyright © 2018 Thiago Correa. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    var quizManager = QuizManager()
    
    
    @IBOutlet var btAnswers: [UIButton]!
    @IBOutlet weak var viTimer: UIView!
    
    @IBOutlet weak var lbQuestion: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viTimer.frame.size.width = view.frame.size.width
        UIView.animate(withDuration: 25.0 , delay: 0, options: .curveLinear, animations: {
            self.viTimer.frame.size.width = 0
        }) { (success) in
            self.showResults()
        }
        self.getNewQuiz()
    }
    
    func getNewQuiz(){
        quizManager.refreshQuiz()
        lbQuestion.text = quizManager.question
        
        for i in 0..<quizManager.options.count{
            let option = quizManager.options[i]
            let button = btAnswers[i]
            button.setTitle(option, for: .normal)
        }
    }
    
    func showResults(){
        performSegue(withIdentifier: "resultSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let _resultViewController = segue.destination as! ResultViewController
        
        _resultViewController.totalAnswers = quizManager.totalAnswers
        _resultViewController.totalCorrectAnswers = quizManager.totalCorrectAnswers
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func selectAnswer(_ sender: Any) {
        
        let index = btAnswers.index(of: sender as! UIButton)
        quizManager.validateAnswer(index: index!)
        self.getNewQuiz()
        
    }
    

}
