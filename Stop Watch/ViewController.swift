//
//  ViewController.swift
//  Stop Watch
//
//  Created by Page Kallop on 10/29/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerDisplay: UILabel!
    
    @IBOutlet weak var resetButton: UIButton!
    
    
    @IBOutlet weak var stopButton: UIButton!
    
    @IBOutlet weak var start: UIButton!
    
    // Initialize timer
    var counter = 0.00
    var timer = Timer()
    var isRunning = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        timerDisplay.text = String(counter)
        stopButton.isEnabled = false
        
//Mark - Button/Label Design
        timerDisplay.layer.cornerRadius = 5.0
        timerDisplay.layer.masksToBounds = true
        timerDisplay.textAlignment = .center
        
        stopButton.layer.cornerRadius = stopButton.bounds.width / 2.0
        stopButton.layer.borderWidth = 3
        stopButton.layer.borderColor = UIColor.darkGray.cgColor
        
       
        start.layer.cornerRadius = start.bounds.width / 2.0
        start.layer.borderWidth = 3
        start.layer.borderColor = UIColor.darkGray.cgColor
        
        
        resetButton.layer.cornerRadius = start.bounds.width / 5.0
        resetButton.layer.borderWidth = 3
        resetButton.layer.borderColor = UIColor.darkGray.cgColor
      
        
    }
// Reset Button Functionality
    @IBAction func resetButton(_ sender: UIButton) {
        start.isEnabled = true
        stopButton.isEnabled = false
        timer.invalidate()
        isRunning = false
        counter = 0.0
        timerDisplay.text = String(counter)
    }
    
    // Stop Button Functionality
    
    @IBAction func stopButton(_ sender: UIButton) {
        
        start.isEnabled = true
        stopButton.isEnabled = false
        timer.invalidate()
        isRunning = false
    }
    
    // Start Button Functionality
    
    @IBAction func startButton(_ sender: UIButton) {
        
        if(isRunning){
            return
        }
        start.isEnabled = false
        stopButton.isEnabled = true
        
        // Create timer
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
    }
    
    // Adding time to timer
    
    @objc func UpdateTimer(){
        counter = counter + 0.1
        timerDisplay.text = String(format: "%.2f", counter)
    }
}

