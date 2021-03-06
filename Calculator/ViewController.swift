//
//  ViewController.swift
//  Calculator
//
//  Created by 伊芸拓真 on 2018/03/03.
//  Copyright © 2018年 伊芸拓真. All rights reserved.
//

import UIKit

enum Operator {
    case undefined          // 未定義
    case addition           // 加法
    case subtraction        // 減法
    case multiplication     // 乗法
    case division           // 除法
}

class ViewController: UIViewController {
    
    var firstValue = 0
    var secondValue = 0
    var currentOperator = Operator.undefined

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func numberButtonTapped(_ sender: UIButton) {
        let value = Int(sender.currentTitle!)!
        if currentOperator == .undefined {
            firstValue = firstValue * 10 + value
            label.text = "\(firstValue)"
        } else {
            secondValue = secondValue * 10 + value
            label.text = "\(secondValue)"
        }
    }
    
    @IBAction func allClearButtonTapped(_ sender: UIButton) {
        firstValue = 0
        secondValue = 0
        currentOperator = .undefined
        label.text = "0"
    }
    
    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        switch sender.currentTitle! {
        case "+":
            currentOperator = .addition
        case "−":
            currentOperator = .subtraction
        case "×":
            currentOperator = .multiplication
        case "÷":
            currentOperator = .division
        default:
            currentOperator = .undefined
        }
    }
    
    @IBAction func equalButtonTapped(_ sender: UIButton) {
        var value = 0
        switch currentOperator {
        case .addition:
            value = firstValue + secondValue
        case .subtraction:
            value = firstValue - secondValue
        case .multiplication:
            value = firstValue * secondValue
        case .division:
            value = firstValue / secondValue
        case .undefined:
            value = firstValue
        }
        label.text = "\(value)"
        firstValue = 0
        secondValue = 0
        currentOperator = .undefined
    }
}

