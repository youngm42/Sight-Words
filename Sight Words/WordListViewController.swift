//
//  WordListViewController.swift
//  Sight Words
//
//  Created by Matthew Young on 5/14/24.
//

import Foundation
import UIKit

class WordListViewController: UIViewController {
    
    var userWordList: [String] = ["good", "elephant", "take", "what", "six"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startTrialSegue" {
            if let destinationVC = segue.destination as? ViewController {
                destinationVC.WORDLIST = userWordList
            }
        }
    }
    
    @IBAction func textBox1(_ sender: UITextField) {
        userWordList[0] = sender.text ?? "empty"
        print("user word list = ", userWordList)
    }
    @IBAction func textBox2(_ sender: UITextField) {
        userWordList[1] = sender.text ?? "empty"
        print("user word list = ", userWordList)
    }
    @IBAction func textBox3(_ sender: UITextField) {
        userWordList[2] = sender.text ?? "empty"
        print("user word list = ", userWordList)
    }
    @IBAction func textBox4(_ sender: UITextField) {
        userWordList[3] = sender.text ?? "empty"
        print("user word list = ", userWordList)
    }
    @IBAction func textBox5(_ sender: UITextField) {
        userWordList[4] = sender.text ?? "empty"
        print("user word list = ", userWordList)
    }
}

