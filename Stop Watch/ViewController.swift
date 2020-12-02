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
    
    var counter = 0.0
    var timer = Timer()
    var isRunning = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        timerDisplay.text = String(counter)
        stopButton.isEnabled = false
        
//Mark - Button Design
        stopButton.layer.cornerRadius = stopButton.bounds.width / 5.0
        stopButton.layer.borderWidth = 3
        stopButton.layer.borderColor = UIColor.black.cgColor
        
       
        start.layer.cornerRadius = start.bounds.width / 5.0
        start.layer.borderWidth = 3
        start.layer.borderColor = UIColor.black.cgColor
        
        
        resetButton.layer.cornerRadius = start.bounds.width / 5.0
        resetButton.layer.borderWidth = 3
        resetButton.layer.borderColor = UIColor.black.cgColor
      
        
    }
//Mark Button Functionality
    @IBAction func resetButton(_ sender: UIButton) {
        start.isEnabled = true
        stopButton.isEnabled = false
        timer.invalidate()
        isRunning = false
        counter = 0.0
        timerDisplay.text = String(counter)
    }
    
    @IBAction func stopButton(_ sender: UIButton) {
        
        start.isEnabled = true
        stopButton.isEnabled = false
        timer.invalidate()
        isRunning = false
    }
    
    @IBAction func startButton(_ sender: UIButton) {
        
        if(isRunning){
            return
        }
        start.isEnabled = false
        stopButton.isEnabled = true
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func UpdateTimer(){
        counter = counter + 0.1
        timerDisplay.text = String(format: "%.2f", counter)
    }
}
