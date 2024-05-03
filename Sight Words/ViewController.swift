//
//  ViewController.swift
//  Sight Words
//
//  Created by Matthew Young on 5/2/24.
//

import UIKit

class ViewController: UIViewController {

    var wordList: [String] = []
    var currWord: String = ""
    var tokenCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wordList = ["good", "elephant", "take", "six", "what"]
        currWord = wordList.randomElement()!
        print(currWord)

        // Do any additional setup after loading the view.
    }
    
    
    

    @IBOutlet weak var checkBox1: UIImageView!
    @IBOutlet weak var checkBox2: UIImageView!
    @IBOutlet weak var checkBox3: UIImageView!
    @IBOutlet weak var checkBox4: UIImageView!
    @IBOutlet weak var checkBox5: UIImageView!

    @IBAction func wordButton(_ sender: UIButton) {
        print(sender.titleLabel?.text!)
        if sender.titleLabel?.text == self.currWord {
            print("That is correct!")
            tokenCount += 1
            switch tokenCount {
            case 1:
                checkBox1.image = UIImage(named: "pinkCheckedBox")
            case 2:
                checkBox2.image = UIImage(named: "pinkCheckedBox")
            case 3:
                checkBox3.image = UIImage(named: "pinkCheckedBox")
            case 4:
                checkBox4.image = UIImage(named: "pinkCheckedBox")
            case 5:
                checkBox5.image = UIImage(named: "pinkCheckedBox")
            default:
                print("hooray!")
            }
        } else {
            // highlight correct answer and replay cue
            // have separate audio for prompted answer vs unprompted (i.e., dependent on whether a check is earned)?
        }
    }
}

