//
//  ViewController.swift
//  HitTarget
//
//  Created by Brian Canela on 12/13/17.
//  Copyright © 2017 Brian Canela. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue: Int = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    var targetValue: Int = 0
    var score = 0
   
    @IBOutlet weak var scoreLabel: UILabel!
  
    @IBOutlet weak var roundLabel: UILabel!
    var round = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentValue = lroundf(slider.value)
        startNewGame()
        
    }
    
   @IBAction func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    func startNewRound() {
     round += 1
     targetValue = 1 + Int(arc4random_uniform(100)) //1-100
     currentValue = 50
     slider.value = Float(currentValue)
     updateLabels()
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        print("The value of the slider is now: \(slider.value)")
        currentValue = lroundf(slider.value)
    }
    

    
    @IBAction func showAlert() {
        
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100 //if difference is perfeect then give player 100 addition points
        }else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        }else if difference < 10 {
            title = "Pretty good!"
        }else {
            title = "Not even close..."
        }
        
        score += points //score = score + points
        
        
        
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
        let action = UIAlertAction(title: "Great", style: .default, handler: {
            action in
            self.startNewRound()
        })
    
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
     
    }
    

    
    
    
    

}

