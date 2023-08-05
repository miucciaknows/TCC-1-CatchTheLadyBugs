//
//  UIConfiguration.swift
//  CatchTheBubbles
//
//  Created by Nathalia Trazzi on 05/08/23.
//

import Foundation
import UIKit

extension ViewController {
    func setupHighScore() {
        if let storeHighScore = UserDefaults.standard.object(forKey: "HighScore") as? Int {
            highScore = Double(storeHighScore)
            highScoreLabel.text = "Recorde: \(highScore)"
        }
    }
    
    func setupGestureRecognizers() {
        for ladybug in ladybugArray {
            let recognizer = UIPinchGestureRecognizer(target: self, action: #selector(increaseScore))
            recognizer.scale = 3
            ladybug.isUserInteractionEnabled = true
            ladybug.addGestureRecognizer(recognizer)
        }
    }
    
    func setupTimers() {
        counter = 60
        timeLabel.text = "Time: \(counter)"
        time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timefunc), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.9, target: self, selector: #selector(hideladybug), userInfo: nil, repeats: true)
    }
    
    func setupLadybugArray() {
        ladybugArray = [ladybug1, ladybug2, ladybug3, ladybug4, ladybug5, ladybug6, ladybug7, ladybug8, ladybug9]
    }
}
