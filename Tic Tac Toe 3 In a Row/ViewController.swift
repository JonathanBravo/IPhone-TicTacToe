//
//  ViewController.swift
//  Tic Tac Toe 3 In a Row
//
//  Created by Jonathan Flowers on 2/4/19.
//  Copyright © 2019 Jonathan Flowers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //decalare images, an array to store the score,
    //and an int to keep the turn value
    let ximage = UIImage(named: "cross.png")
    let oimage = UIImage(named: "nought.png")
    var endGameWinner = "nobody yet"
    
    var winArray = [[0,0,0],
                    [0,0,0],
                    [0,0,0]]
    var turn = 1
    
    @IBOutlet weak var winLabel: UILabel!
    
    //create variables to store array values
    var xValue = 1
    var oValue = 2
    var row = 0;
    var column = 0;
    
    //function to restart game
    func restartGame(){
        winArray = [[0,0,0],
                    [0,0,0],
                    [0,0,0]]
        winLabel.text = ""
        turn = 1
        button1.setImage(nil, for: [])
        button2.setImage(nil, for: [])
        button3.setImage(nil, for: [])
        button4.setImage(nil, for: [])
        button5.setImage(nil, for: [])
        button6.setImage(nil, for: [])
        button7.setImage(nil, for: [])
        button8.setImage(nil, for: [])
        button9.setImage(nil, for: [])
    }
    @IBOutlet weak var restartButton: UIButton!
    
    @IBAction func gameRestart(_ sender: Any) {
        restartGame()
        restartButton.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    }
    
    //function to score the points
    func scorePoint (row: Int, column: Int){
        if turn == 1{
            winArray[row][column] = xValue
        }
        else if turn % 2 == 0{
            winArray[row][column] = oValue
        }
        else{
        winArray[row][column] = xValue
        }
    }
    
    var winner = Bool()
    //function to test if there is a winner
    func winnerTest (){
        if (winArray[0][0] != 0) && (winArray[0][0] == winArray[0][1]) && (winArray[0][1] == winArray[0][2]){
            winner = true
        }
        else if (winArray[0][0] != 0) && (winArray[0][0] == winArray[1][0]) && (winArray[1][0] == winArray[2][0]){
            winner = true
        }
        else if (winArray[0][2] != 0) && (winArray[0][2] == winArray[1][2]) && (winArray[1][2] == winArray[2][2]){
            winner = true
        }
        else if (winArray[1][0] != 0) && (winArray[1][0] == winArray[1][1]) && (winArray[1][1] == winArray[1][2]){
            winner = true
        }
        else if (winArray[2][0] != 0) && (winArray[2][0] == winArray[2][1]) && (winArray[2][1] == winArray[2][2]){
            winner = true
        }
        else if (winArray[0][1] != 0) && (winArray[0][1] == winArray[1][1]) && (winArray[1][1] == winArray[2][1]){
            winner = true
        }
        else if (winArray[0][0] != 0) && (winArray[0][0] == winArray[1][1]) && (winArray[1][1] == winArray[2][2]){
            winner = true
        }
        else if (winArray[0][2] != 0) && (winArray[0][2] == winArray[1][1]) && (winArray[1][1] == winArray[2][0]){
            winner = true
        }
        else{
            winner = false
        }
        
        if winner == true{
            
            if turn % 2 == 0{
                endGameWinner = "O's Win! 3 in a row."
            }
            else{
                endGameWinner = "X's Win! 3 in a row"
            }
            winLabel.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
            winLabel.text = endGameWinner
            
            UIView.animate(withDuration: 1){
                self.winLabel.frame = CGRect(x: 0, y: -50, width: 400, height: 400)
            }
            UIView.animate(withDuration: 1){
                self.restartButton.frame = CGRect(x: 0, y: 453, width: 400, height: 400)
            }
        }
    }
    
    //declare function to change image for button pressed
    func buttonImageSwitch (button: UIButton){
        if(turn == 1){
            button.setImage(ximage, for: [])
        }else if turn % 2 == 0{
            button.setImage(oimage, for: [])
        }
        else{
            button.setImage(ximage, for: [])
        }
    }
    
    
    
    //Declare outlets to hold x and o images
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    
    @IBAction func changeImage(_ sender: UIButton){
        
        
        switch sender.tag{
        case 1:
            buttonImageSwitch(button: button1)
            scorePoint (row: 0, column: 0)
        case 2:
            buttonImageSwitch(button: button2)
            scorePoint (row: 0, column: 1)
        case 3:
            buttonImageSwitch(button: button3)
            scorePoint (row: 0, column: 2)
        case 4:
            buttonImageSwitch(button: button4)
            scorePoint (row: 1, column: 0)
        case 5:
            buttonImageSwitch(button: button5)
            scorePoint (row: 1, column: 1)
        case 6:
            buttonImageSwitch(button: button6)
            scorePoint (row: 1, column: 2)
        case 7:
            buttonImageSwitch(button: button7)
            scorePoint (row: 2, column: 0)
        case 8:
            buttonImageSwitch(button: button8)
            scorePoint (row: 2, column: 1)
        case 9:
            buttonImageSwitch(button: button9)
            scorePoint (row: 2, column: 2)
        default:
            break
            
        }
        winnerTest()
        
        turn = turn + 1
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        restartButton.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        // Do any additional setup after loading the view, typically from a nib.
        
    }


}

