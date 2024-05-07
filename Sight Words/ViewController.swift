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
    var firstAttempt = true
    let WORDLIST = ["zoo", "milk", "rabbit", "her", "jump"]

    var audioPlayer: AVAudioPlayer?
    
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
        wordList = WORDLIST
        currWord = wordList.randomElement()!
        print(currWord)
        playSound(soundName: currWord)

    }
    
    func playSound(soundName: String) {
        if let path = Bundle.main.path(forResource: soundName, ofType: "m4a") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        }
    }

    
    func playPing() {
        if let path = Bundle.main.path(forResource: "ping", ofType: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        }
    }
    
    func playWav(soundName: String) {
        if let path = Bundle.main.path(forResource: soundName, ofType: "wav") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.play()
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        }
    }
    
    func removeWord(word: String) {
        if let index = wordList.firstIndex(of: word) {
            wordList.remove(at: index)
        }
    }
    
    func shuffleWords() {
        wordList = WORDLIST
        wordList.shuffle()
        for (button) in wordButtons {
            button.titleLabel?.adjustsFontSizeToFitWidth = true
            button.titleLabel?.font = UIFont.systemFont(ofSize: 31)
            if let title = wordList.popLast() {
                button.setTitle(title, for: .normal)
            }
        }
    }
    
    func highlightCorrectButton(withTitle title: String) {
        for button in wordButtons {
            if let buttonTitle = button.titleLabel?.text, buttonTitle == currWord {
                // Modify the background color of the correct button
                button.backgroundColor = UIColor.green // Example color
                break // Exit the loop once the correct button is found
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
            
            
            //TODO: Indicate to user that answer is correct - play sound, flash button color, outline button, animation?
            sender.backgroundColor = UIColor.systemMint
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [self] in
                sender.backgroundColor = UIColor.purple
                if !wordList.isEmpty {
                    playSound(soundName: currWord)
                }
            }
            
            if firstAttempt == true {
                tokenCount += 1
                playWav(soundName: "correct")
                removeWord(word: currWord)
            } else {
                playPing()
            }
            
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
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) { [self] in
                    playWav(soundName: "applause")
                }
                
            default:
                print("hooray")
            
            }
            
            if !wordList.isEmpty {
                currWord = wordList.randomElement()!
                print("wordList = ", wordList)
                print("currWord = ", currWord)
            }
            firstAttempt = true
            
        } else {
            firstAttempt = false
            sender.backgroundColor = UIColor.lightGray
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [self] in
                sender.backgroundColor = UIColor.purple
                highlightCorrectButton(withTitle: currWord)
                playSound(soundName: currWord)
                    }
            
            // TODO
            // highlight correct answer and replay cue
            // have separate audio for prompted answer vs unprompted (i.e., dependent on whether a check is earned)?
        }
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        shuffleWords()
        wordList = WORDLIST
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
        playSound(soundName: currWord)
    }
}

