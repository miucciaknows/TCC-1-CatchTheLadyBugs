//Desenvolvido do dia 19 ao dia 22 de Novembro de 2021
//Versão da interface em Português BR
//This game has been made in 2021.
//This interface has been created to be in portuguese, all objects and gestures are in English for better understand.
//Controller

import UIKit


class ViewController: UIViewController {
    
//Isso aqui não está sendo usado no momento, deixei por default porque estava tentando puxar o gesture "pinça" do story board e achei que a implementação ficaria melhor por aqui, qualquer duvida me pergunte.
    //Ignore here
/*
    @IBOutlet var pinch1: UIPinchGestureRecognizer!
    @IBOutlet var pinch2: UIPinchGestureRecognizer!
    @IBOutlet var pinch3: UIPinchGestureRecognizer!
    @IBOutlet var pinch4: UIPinchGestureRecognizer!
    @IBOutlet var pinch5: UIPinchGestureRecognizer!
    @IBOutlet var pinch6: UIPinchGestureRecognizer!
    @IBOutlet var pinch7: UIPinchGestureRecognizer!
    @IBOutlet var pinch8: UIPinchGestureRecognizer!
    @IBOutlet var pinch9: UIPinchGestureRecognizer!
    //From here.
    */
    //Variaveis do jogo como array da joaninha, variavel de tempo, contator, pontuação, maior pontuação.
    //Declaring variables such as lady array, time, time, counter, score and high score.
    
    var ladybugArray = [UIImageView]()
    var time = Timer()
    var hideTimer = Timer()
    var counter = 0
    var score: Double = 0
    var highScore: Double = 0
    

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
   
    //lady bug's images from story board.
    //todas essas imagens das 9 joaninhas estão no story board, eu declarei elas para ver onde ficaram e puxei elas pra cá e referenciando.
   
    @IBOutlet weak var ladybug1: UIImageView!
    @IBOutlet weak var ladybug2: UIImageView!
    @IBOutlet weak var ladybug3: UIImageView!
    @IBOutlet weak var ladybug4: UIImageView!
    @IBOutlet weak var ladybug5: UIImageView!
    @IBOutlet weak var ladybug6: UIImageView!
    @IBOutlet weak var ladybug7: UIImageView!
    @IBOutlet weak var ladybug8: UIImageView!
    @IBOutlet weak var ladybug9: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//Função para pinch gesture que puxei atraves do story board, por favor ignorem porque foi apenas teste, deixei de back up.
/*
        func handlePan(_ gesture: UIPinchGestureRecognizer) {
             guard let gestureView = gesture.view else {
               return
             }

            gestureView.transform = gestureView.transform.scaledBy(
              x: gesture.scale,
              y: gesture.scale
            )
            gesture.scale = 1
        }

 */
        //HighScore Check
        let storeHighScore = UserDefaults.standard.object(forKey: "HighScore")
    
        if storeHighScore == nil {
            highScore = 0
            
            highScoreLabel.text = "Recorde: \(highScore)"
        }

        
        if let newScore = storeHighScore as? Int {
            highScore = Double(newScore)
            highScoreLabel.text = "Recorde: \(highScore)"
        }
        
        //Counter de quanto tempo o jogo fica funcionando antes de acabar o tempo, o valor default do tempo é 60 e a cada 0.9 segundos uma nova joaninha aparece.
        counter = 60 //O contador do jogo é de 60 segundos, 1 minuto.
        timeLabel.text = "Time: " + String(counter)
        time=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timefunc), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.9, target: self, selector: #selector(hideladybug), userInfo: nil, repeats: true) //Tempo intervalo entre uma joaninha e outra.
       
        //O texto "Pontos" que aparece no jogo.
        //Score text
        //scoreLabel.text="Pontos: \(score)"
        
        self.scoreLabel.text = String (format: "%.f", score)
        
        
        
        //Interação do usuario com o valor de true, porque está funcionando.
        
        ladybug1.isUserInteractionEnabled=true
        ladybug2.isUserInteractionEnabled=true
        ladybug3.isUserInteractionEnabled=true
        ladybug4.isUserInteractionEnabled=true
        ladybug5.isUserInteractionEnabled=true
        ladybug6.isUserInteractionEnabled=true
        ladybug7.isUserInteractionEnabled=true
        ladybug8.isUserInteractionEnabled=true
        ladybug9.isUserInteractionEnabled=true
        
        //Aqui é onde o gesto "pinça está declarado"
        let recognizer1 = UIPinchGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UIPinchGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UIPinchGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UIPinchGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UIPinchGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UIPinchGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UIPinchGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UIPinchGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UIPinchGestureRecognizer(target: self, action: #selector(increaseScore))
        //A escada do "zoom" da pinça se controla por aqui, lembrando que a Apple diz que o valor default é de 1.
        //Value default recommended from Apple is 1.
        recognizer1.scale = 3
        recognizer2.scale = 3
        recognizer3.scale = 3
        recognizer4.scale = 3
        recognizer5.scale = 3
        recognizer6.scale = 3
        recognizer7.scale = 3
        recognizer8.scale = 3
        recognizer9.scale = 3
        
        //Adicionando o reconhecimento de gesto "pinça" para as joaninhas.
        
        ladybug1.addGestureRecognizer(recognizer1)
        ladybug2.addGestureRecognizer(recognizer2)
        ladybug3.addGestureRecognizer(recognizer3)
        ladybug4.addGestureRecognizer(recognizer4)
        ladybug5.addGestureRecognizer(recognizer5)
        ladybug6.addGestureRecognizer(recognizer6)
        ladybug7.addGestureRecognizer(recognizer7)
        ladybug8.addGestureRecognizer(recognizer8)
        ladybug9.addGestureRecognizer(recognizer9)
        
        //Não precisa dizer nada, né? o nome diz o que isso faz.
        //The name say for itself.
        
        ladybugArray = [ladybug1,ladybug2,ladybug3,ladybug4,ladybug5,ladybug6,ladybug7, ladybug8, ladybug9]
        
        hideladybug()
    }
    
    

    
    //Função esconde a joaninha enquanto uma está aparecendo de cada vez.
    
   @objc func hideladybug(){
        for ladybug in ladybugArray {
            ladybug.isHidden=true
        }
        
        let random = Int (arc4random_uniform(UInt32(ladybugArray.count - 1)))
    ladybugArray[random].isHidden = false
    }
    
    //Função onde acrescenta meio ponto quando faz a pinça, lembrando que se a pinça continuar "aberta" ele vai continuar computando pontos. Coloquei o valor de score baixo por essa razão. Quanto mais tempo manter os dedos em aberto, maior será a pontuação no final do jogo.
    //I set the score value low for a reason: the longer you keeping your two fingers open more higher your score at the end of the game will be.
    
    @objc func increaseScore(){
        score += 0.2
        scoreLabel.text="Pontos: \(score)"
        
    }
    
    @objc func timefunc(){
        counter -= 1
        timeLabel.text="Tempo restante: \(counter)"
       
        if counter == 0{
            
            hideTimer.invalidate()
            
            for ladybug in ladybugArray {
                ladybug.isHidden = true
            }
            
            if score > highScore{
                highScore = score
                highScoreLabel.text = "Recorde: \(score)"
                
                UserDefaults.standard.set(highScore, forKey: "Recorde: ")
            }
                
            timeLabel.text="O Tempo acabou!"
            time.invalidate()
            
            //Alert
            //Caso o usuario queira jogar novamente.
            //"if you want to play again" alert.
            let alert = UIAlertController(title: "Você jogou durante 2 minutos... ", message: "Gostaria de jogar novamente?", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "Não", style: UIAlertAction.Style.cancel, handler: nil)
            let restartButton = UIAlertAction(title: "Sim", style: UIAlertAction.Style.default) { (UIAlertAction) in
                self.score = 0
                self.scoreLabel.text = "Pontuação: \(self.score)"
                self.counter = 60
                self.timeLabel.text = String(self.counter)
                self.time=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timefunc), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.9, target: self, selector: #selector(self.hideladybug), userInfo: nil, repeats: true)
            }
            alert.addAction(okButton)
            alert.addAction(restartButton)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
 
    
    


}

