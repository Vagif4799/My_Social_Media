//
//  ViewController.swift
//  BullsEyeDemo
//
//  Created by Guliyev Vagif on 8/20/19.
//  Copyright © 2019 Quliyev Vagif. All rights reserved.
//




import UIKit

class ViewController: UIViewController {
    
    // the value when slider first begins (just initializating)
    var currentValue: Int = 0
    // the value that random number function set for us (it 's set by game)
    var targetValue: Int = 0
    // this one will show total score that collected through all rounds
    var score = 0
    // rounds should start from 1
    var round = 1
    
    // creating outlet to get gloabal value of the slider
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var totalScore: UILabel!
    @IBOutlet weak var roundLabel: UILabel!

    override func viewDidLoad() {
        // we code eveything what we wanna see as soon as the app loads
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // if user not slide it, gonna show current value but rounded (71.7777 -> 72)
        let roundedValue = slider.value.rounded()
        // rounded() function result is float type, so we convert it to integer
        currentValue = Int (roundedValue)
        // in each round we wanna reset the game and slider
        startNewGame()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbIageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbIageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }
    
    @IBAction func showAlert() {
        
        // we wanna show difference between targetValue and Value choosen by User
        // here abs gives absolute value and comes from foundation
        let difference = abs(targetValue-currentValue)
        var points = 100 - difference
        // every single time we will increase this total score
        score += points
        // implementing some additional bonus points for the motivation to be focused :)
        if difference == 0 {
            points += 100
        } else if difference == 1 {
            points += 50
        }
        // let's round up here
        round += 1
        // title displayed on message will differ according to our result
        let title: String
        if difference == 0 {
            title = "Perfect!"
        } else if difference < 5 {
            title = "You almost had it!"
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even Close."
        }
        // in this message we gonna show all the important things to the user
        let message = "You scored \(points) points"
        // Let's add alert button
        // First part is for top part of message
        //  in let alert I can change preferredStyle to .action... it will pop from the bottom
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        // in handler section we've used clousure which happens after we touch action button
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.startNewRound()
        })
        // Second part is for click button
        // putting dot (.) after variable means, we wanna apply the function specifically to that variable
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        // here we can see that swift don't give f* to line hireracy, so we've used this variable before set
        
    }
    
    
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        
        // if user not slide it, gonna show current value but rounded (71.7777 -> 72)
        let roundedValue = slider.value.rounded()
        // rounded() function result is float type, so we convert it to integer
        currentValue = Int (roundedValue)
        
    }

    // DIY -> don't repeat yourself, we put eveything into single func what we do after each round (reseting)
    func startNewRound() {
        
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
        
    }
    
    func updateLabels() {
        
        // via this function we set text of our label to targetValue
        targetLabel.text = String(targetValue)
        // total points 's scored will be presented here
        totalScore.text = String(score)
        // round label gonna show current round
        roundLabel.text = String(round)
        
    }
    
    @IBAction func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }
    
}

