//
//  ViewController.swift
//  FlagGame
//
//  Created by Ecem Aleyna on 26.03.2020.
//  Copyright © 2020 Ecem Aleyna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var limit = 10
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        countries += ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US","Turkey"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.brown.cgColor
        button2.layer.borderColor = UIColor.brown.cgColor
        button3.layer.borderColor = UIColor.brown.cgColor
    
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil){
            
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
            
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
            
        title = "\(countries[correctAnswer].uppercased()) - Score \(score)"
    }
    
    func newGame(action: UIAlertAction! = nil){
        counter = 0
        score = 0
        askQuestion()
        
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title : String
        var message : String
        
        counter += 1
        
        if sender.tag == correctAnswer{
            title = "Correct"
            score += 1
            message = "Your score is \(score)"
                       
        } else {
            title = "Wrong"
            score += 0
            message = "That's the flag of \(countries[sender.tag].uppercased()). Your score is \(score)"
            
        }
        
        let ac : UIAlertController
        
        if counter == limit {
            ac = UIAlertController(title: "Game is Over" , message: "Your final score is \(score) out of \(counter) questions", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title : "New game", style : .default , handler : newGame))
            
        } else {
            ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        }
        present(ac, animated: true)
        
    }
    
}

