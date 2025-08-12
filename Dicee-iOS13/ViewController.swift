//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    // Array of dice images
    let diceArray = [
        #imageLiteral(resourceName: "DiceOne"),
        #imageLiteral(resourceName: "DiceTwo"),
        #imageLiteral(resourceName: "DiceThree"),
        #imageLiteral(resourceName: "DiceFour"),
        #imageLiteral(resourceName: "DiceFive"),
        #imageLiteral(resourceName: "DiceSix")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set initial dice faces
        diceImageView1.image = diceArray[0]
        diceImageView2.image = diceArray[0]
    }

    @IBAction func rollButtenPressed(_ sender: UIButton) {
        // Add a subtle animation to the button
        UIView.animate(withDuration: 0.1, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                sender.transform = CGAffineTransform.identity
            }
        }
        
        // Generate random numbers for both dice (0-5 for array indices)
        let randomDice1 = Int.random(in: 0...5)
        let randomDice2 = Int.random(in: 0...5)
        
        // Update dice images with random faces
        diceImageView1.image = diceArray[randomDice1]
        diceImageView2.image = diceArray[randomDice2]
        
        // Add a subtle rotation animation to the dice
        UIView.animate(withDuration: 0.3, animations: {
            self.diceImageView1.transform = CGAffineTransform(rotationAngle: .pi * 2)
            self.diceImageView2.transform = CGAffineTransform(rotationAngle: .pi * 2)
        }) { _ in
            self.diceImageView1.transform = CGAffineTransform.identity
            self.diceImageView2.transform = CGAffineTransform.identity
        }
    }
}

