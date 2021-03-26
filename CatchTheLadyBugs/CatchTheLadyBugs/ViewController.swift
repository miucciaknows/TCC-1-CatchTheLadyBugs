//Versão da interface em Português BR
//This game has been made in 2021.
//This interface has been created to be in portuguese, all objects and gestures are in English for better understand.



//UI KIT
import UIKit

//Classe Controller
class ViewController: UIViewController {

    //Variaveis do jogo como array da joaninha, variavel de tempo, contator, pontuação, maior pontuação.
    //Declaring variables such as lady array, time, time, counter, score and high score.
    
    var ladybugArray = [UIImageView]()
    var time = Timer()
    var hideTimer = Timer()
    var counter = 0
    var score: Double = 0
    var highScore: Double = 0
    
    
    //Função onde está definido o score a cada vez que o movimento "pinça" termina, e para esconder uma joaninha quando o ponto é computado.
    //This function is for score and a few things that happens with lady bug while you're pinching it.
    var lastScale:CGFloat!
    @objc func zoom(_ gesture: UIPinchGestureRecognizer) {
        //guard gesture.view != nil else {
           //return
         //}

        gesture.scale = 0.2
     
        if (gesture.state == .ended) {
             increaseScore()
             hideladybug()
             
        }
    }
    
    //BACK UP, PLEASE IGNORE THAT. testing a few functions to choose a better one.
    //ignore here
/*
    var lastScale:CGFloat!
     @objc func zoom(gesture:UIPinchGestureRecognizer) {
         //if(gesture.state == .began) {
             // Reset the last scale, necessary if there are multiple objects with different scales
            //gesture.scale = 0.5
             //lastScale = gesture.scale
             
         //}
         if (gesture.state == .began || gesture.state == .changed) {
      
         let transform = (gesture.view?.transform)!.scaledBy(x: 0, y: 0);
         gesture.view?.transform = transform
         }
          //gesture.scale = 1.0
         //lastScale = gesture.scale  // Store the previous scale factor for the next pinch gesture call
            //if (gesture.state == .began || gesture.state == .ended) {
            if (gesture.state == .ended) {
                    increaseScore()
                    hideladybug()
            
       }
     }
    
//}
    //From here
*/
    

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    

    //lady bug's images from story board.
    //todas essas imagens das 9 joaninhas estão no story board, eu declarei elas para ver onde ficaram e puxei elas pra cá para referenciar.
    
    
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
    

        //HighScore
        let storeHighScore = UserDefaults.standard.object(forKey: "HighScore")
    
        if storeHighScore == nil {
            highScore = 0
            
            highScoreLabel.text = "Recorde: \(highScore)"
        }

        //Onde define um novo recorde.
        //creating a new high score
        if let newScore = storeHighScore as? Int {
            highScore = Double(newScore)
            highScoreLabel.text = "Recorde: \(highScore)"
        }
        
        //Counter de quanto tempo o jogo fica funcionando antes de acabar o tempo valor default do tempo é 60 e a cada 2.5 segundos uma nova joaninha aparece.
        counter = 60 //O contador do jogo é de 60 segundos, 1 minuto.
        timeLabel.text = "Time: " + String(counter)
        time=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timefunc), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(hideladybug), userInfo: nil, repeats: true) //Tempo intervalo entre uma joaninha e outra.
       
        //O texto "Pontos" que aparece no jogo. não sei porque usei double, talvez porque queria dar 0.5 em algumas ocasiões e 1 em outras, talez isso mude.
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
        let recognizer1 = UIPinchGestureRecognizer(target: self, action: #selector(zoom))
        let recognizer2 = UIPinchGestureRecognizer(target: self, action: #selector(zoom))
        let recognizer3 = UIPinchGestureRecognizer(target: self, action: #selector(zoom))
        let recognizer4 = UIPinchGestureRecognizer(target: self, action: #selector(zoom))
        let recognizer5 = UIPinchGestureRecognizer(target: self, action: #selector(zoom))
        let recognizer6 = UIPinchGestureRecognizer(target: self, action: #selector(zoom))
        let recognizer7 = UIPinchGestureRecognizer(target: self, action: #selector(zoom))
        let recognizer8 = UIPinchGestureRecognizer(target: self, action: #selector(zoom))
        let recognizer9 = UIPinchGestureRecognizer(target: self, action: #selector(zoom))
        

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

        //Array
        
        ladybugArray = [ladybug1,ladybug2,ladybug3,ladybug4,ladybug5,ladybug6,ladybug7, ladybug8, ladybug9]
        
        //Hide function
        hideladybug()
    }
    

    //Função esconde a joaninha, assim aparece uma está aparecendo de cada vez.
    //This function hides lady bug's array, i made that to came one lady bug per time.
    
   @objc func hideladybug(){
        for ladybug in ladybugArray {
            ladybug.isHidden=true
        }
        
    let random = Int (arc4random_uniform(UInt32(ladybugArray.count - 4)))
    ladybugArray[random].isHidden = false
    }
    
    //Função score
    //Score function

    @objc func increaseScore(){
        score += 10
        scoreLabel.text="Pontos: \(score)"
        
    }
    //Função tempo restante do jogo
    //Time left function
    @objc func timefunc(){
        counter -= 1
        timeLabel.text="Tempo restante: \(counter)"
       
        if counter == 0{
            hideTimer.invalidate()
            //Esconder a joaninha por um periodo de tempo até vir a próxima
            //Hiding the lady bug util the next one shows up;
            for ladybug in ladybugArray {
                ladybug.isHidden = true
                sleep (9)
            }
            //Criando um novo recorde
            //Creating a new high score
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
                self.hideTimer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.hideladybug), userInfo: nil, repeats: true)
            }
            alert.addAction(okButton)
            alert.addAction(restartButton)
            self.present(alert, animated: true, completion: nil)
        }
    }


}

