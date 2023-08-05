//
//  GameLogic.swift
//  CatchTheBubbles
//
//  Created by Nathalia Trazzi on 05/08/23.
//

import Foundation
import UIKit

extension ViewController {
    @objc func hideladybug() {
        for ladybug in ladybugArray {
            ladybug.isHidden = true
        }
        
        let random = Int(arc4random_uniform(UInt32(ladybugArray.count - 1)))
        ladybugArray[random].isHidden = false
    }
    
    @objc func increaseScore() {
        score += 0.5
        scoreLabel.text = "Pontos: \(score)"
    }
    
    @objc func timefunc() {
        counter -= 1
        timeLabel.text = "Tempo restante: \(counter)"
       
        if counter == 0 {
            endGame()
        }
    }
    
    func endGame() {
        hideTimer.invalidate()
        hideLadybugs()
        
        if score > highScore {
            highScore = score
            highScoreLabel.text = "Recorde: \(score)"
            UserDefaults.standard.set(highScore, forKey: "Recorde: ")
        }
        
        timeLabel.text = "O Tempo acabou!"
        time.invalidate()
        
        showAlert()
    }
    
    func hideLadybugs() {
        for ladybug in ladybugArray {
            ladybug.isHidden = true
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Você jogou durante 2 minutos... ", message: "Gostaria de jogar novamente?", preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "Não", style: .cancel, handler: nil)
        
        let restartButton = UIAlertAction(title: "Sim", style: .default) { _ in
            self.restartGame()
        }
        
        alert.addAction(okButton)
        alert.addAction(restartButton)
        present(alert, animated: true, completion: nil)
    }
    
    func restartGame() {
        score = 0
        scoreLabel.text = "Pontuação: \(score)"
        counter = 60
        timeLabel.text = String(counter)
        time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timefunc), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.9, target: self, selector: #selector(hideladybug), userInfo: nil, repeats: true)
    }
}
