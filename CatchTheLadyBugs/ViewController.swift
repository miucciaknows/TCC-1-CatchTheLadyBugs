//Desenvolvido do dia 19 ao dia 22 de Novembro de 2021
//Versão da interface em Português BR
//This game has been made in 2021.
//This interface has been created to be in Portuguese, all objects and gestures are in English for better understand.
//Controller

import UIKit


class ViewController: UIViewController {
    
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
    
    //Lady bug's images from storyboard.
    //Todas essas imagens das 9 joaninhas estão no storyboard, eu declarei elas para ver onde ficaram e puxei elas pra cá referenciando.
    
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
        
        // Configurações da interface do usuário
        setupHighScore()
        setupGestureRecognizers()
        setupTimers()
        setupLadybugArray()
        hideladybug()
    }
}
