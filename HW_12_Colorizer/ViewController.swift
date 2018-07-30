//
//  ViewController.swift
//  HW_12_Colorizer
//
//  Created by Oleg Dynnikov on 7/30/18.
//  Copyright © 2018 Oleg Dynnikov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countdownLabel: UILabel!
    var timer: Timer?
    var counter = 5

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        countdownLabel.isHidden = true
        countdownUpdateText()
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        timerRemoved()
        counter = 5
        countdownUpdateText()
        countdownLabel.isHidden = false
        view.backgroundColor = sender.backgroundColor
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countdownHandling), userInfo: nil, repeats: true)
    }

    func countdownUpdateText() {
        countdownLabel.text = "Countdown is: \(counter)"
    }

    @objc func countdownHandling() {
        counter -= 1
        countdownUpdateText()
        if counter == 0 {
            view.backgroundColor = .gray
            countdownLabel.isHidden = true
            timerRemoved()
            counter = 5
        }
    }

    func timerRemoved() {
        timer?.invalidate()
        timer = nil
    }
}

