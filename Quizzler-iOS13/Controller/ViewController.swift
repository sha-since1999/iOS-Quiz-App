
import UIKit
class ViewController: UIViewController {
    
    @IBOutlet weak var quiestion: UILabel!
   
    @IBOutlet weak var falsePressed: UIButton!
    @IBOutlet weak var truePressed: UIButton!

    @IBOutlet weak var scoreCard: UILabel!
    @IBOutlet weak var quizProgress: UIProgressView!

    
    var quizbrain = BrainQuiz()
    var timer  = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        UIUpdate()
        
    }
    
    @IBAction func ansPressed(_ sender: UIButton)
      {
        timer.invalidate()
        let userAnswer = sender.currentTitle!

        if quizbrain.checkAnswer(userAnswer)
        {
            sender.backgroundColor = UIColor.green
        }
        else
        {
            sender.backgroundColor = UIColor.red
        }
         quizbrain.nextQuestion()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(UIUpdate) ,userInfo:nil  ,repeats : true )
             
    }
    @objc func UIUpdate ()
    {
        quiestion.text = quizbrain.getQuestion()
        truePressed.backgroundColor = UIColor.clear
        falsePressed.backgroundColor = UIColor.clear
        quizProgress.progress = quizbrain.getProgress()
        scoreCard.text = " Score : \(quizbrain.getScore()) "
        
    }

    
}

