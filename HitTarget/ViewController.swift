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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        currentValue = lroundf(slider.value)
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
        let message = "The value of the slide is: \(currentValue)"
        
        let alert = UIAlertController(title: "Hello, World", message: message, preferredStyle: .alert)
    
        let action = UIAlertAction(title: "Great", style: .default, handler: nil)
    
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    

    
    
    
    

}

