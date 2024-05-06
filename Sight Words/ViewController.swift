//
//  ViewController.swift
//  Sight Words
//
//  Created by Matthew Young on 5/2/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var wordList: [String] = []
    var currWord: String = ""
    var tokenCount = 0
    
    
    class SoundPlayer {
        var audioPlayer: AVAudioPlayer?

        func playSound() {
            if let path = Bundle.main.path(forResource: "good", ofType: "m4a") {
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                    audioPlayer?.play()
                } catch {
                    print("Error playing sound: \(error.localizedDescription)")
                }
            }
        }
    }
    
    var player = SoundPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in wordButtons {
            button.backgroundColor = UIColor.purple
            button.tintColor = UIColor.white
            button.layer.cornerRadius = 10
        }
        playButton.backgroundColor = UIColor.purple
        playButton.tintColor = UIColor.white
        playButton.layer.cornerRadius = 10
        
        shuffleWords()
        wordList = ["good", "elephant", "take", "six", "what"]
        currWord = wordList.randomElement()!
        print(currWord)

    }
    

    
    func removeWord(word: String) {
        if let index = wordList.firstIndex(of: word) {
            wordList.remove(at: index)
        }
    }
    
    func shuffleWords() {
        wordList = ["good", "elephant", "take", "six", "what"]
        wordList.shuffle()
        for (button) in wordButtons {
            button.titleLabel?.adjustsFontSizeToFitWidth = true
            button.titleLabel?.font = UIFont.systemFont(ofSize: 31)
            if let title = wordList.popLast() {
                button.setTitle(title, for: .normal)
            }
        }
    }

    
    
    @IBOutlet var wordButtons: [UIButton]!
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var checkBox1: UIImageView!
    @IBOutlet weak var checkBox2: UIImageView!
    @IBOutlet weak var checkBox3: UIImageView!
    @IBOutlet weak var checkBox4: UIImageView!
    @IBOutlet weak var checkBox5: UIImageView!

    @IBAction func wordButton(_ sender: UIButton) {
        print(sender.titleLabel?.text ?? "No title")
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
            removeWord(word: currWord)
            if !wordList.isEmpty {
                currWord = wordList.randomElement()!
                print("wordList = ", wordList)
                print("currWord = ", currWord)
            }
            
        } else {
            // highlight correct answer and replay cue
            // have separate audio for prompted answer vs unprompted (i.e., dependent on whether a check is earned)?
        }
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        shuffleWords()
        wordList = ["good", "elephant", "take", "six", "what"]
        currWord = wordList.randomElement()!
        print(currWord)
        tokenCount = 0
        checkBox1.image = UIImage(named: "pinkBorderedBox")
        checkBox2.image = UIImage(named: "pinkBorderedBox")
        checkBox3.image = UIImage(named: "pinkBorderedBox")
        checkBox4.image = UIImage(named: "pinkBorderedBox")
        checkBox5.image = UIImage(named: "pinkBorderedBox")
    }
    
    @IBAction func playButton(_ sender: UIButton) {
        player.playSound()
    }
}

