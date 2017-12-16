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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startNewRound()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
    }
    
    func startNewRound() {
    
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
        
        var difference: Int
        
        if currentValue > targetValue {
            difference = currentValue - targetValue
        }else if targetValue > currentValue {
            difference = targetValue - currentValue
        }else {
            difference = 0
        }
        
        
        let message = "The value of the slide is: \(currentValue)" +
        "\nThe target value is: \(targetValue)" +
        "\nThe difference is: \(difference)"
        
        let alert = UIAlertController(title: "Hello, World", message: message, preferredStyle: .alert)
    
        let action = UIAlertAction(title: "Great", style: .default, handler: nil)
    
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    

    
    
    
    

}

