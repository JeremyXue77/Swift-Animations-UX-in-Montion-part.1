//
//  ParentingDemo1ViewController.swift
//  UX in motion demo
//
//  Created by JeremyXue on 2018/6/20.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

class ParentingDemo1ViewController: UIViewController {
    
    var lastValue = 4
    let colorArray = [#colorLiteral(red: 1, green: 0.1857388616, blue: 0.5733950138, alpha: 1),#colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1),#colorLiteral(red: 0.9995340705, green: 0.988355577, blue: 0.4726552367, alpha: 1),#colorLiteral(red: 0.4500938654, green: 0.9813225865, blue: 0.4743030667, alpha: 1),#colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 1),#colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1),#colorLiteral(red: 1, green: 0.5212053061, blue: 1, alpha: 1)]
    let textArray = ["極差","不佳","尚可","普通","不錯","優良","超棒"]
    let emojiArray = ["🤬","😡","😕","😐","🙂","😌","🤩"]
    
    @IBOutlet weak var rateLabel: UILabel! {
        didSet {
            rateLabel.layer.cornerRadius = rateLabel.frame.height / 4
            rateLabel.clipsToBounds = true
            rateLabel.layer.borderColor = #colorLiteral(red: 0.4500938654, green: 0.9813225865, blue: 0.4743030667, alpha: 1)
            rateLabel.layer.borderWidth = 3
        }
    }
    
    @IBOutlet weak var emojiLabel: UILabel! {
        didSet {
            emojiLabel.layer.cornerRadius = emojiLabel.frame.height / 2
            emojiLabel.clipsToBounds = true
        }
    }
    @IBOutlet weak var rateSlider: UISlider!
    
    @IBAction func valueChange(_ sender: UISlider) {
        
        let value = lrintf(sender.value)
        
        if value > lastValue {
            moveX(value: value - lastValue, object: emojiLabel)
            moveX(value: value - lastValue, object: rateLabel)
        } else {
            moveX(value: -(lastValue - value), object: emojiLabel)
            moveX(value: -(lastValue - value), object: rateLabel)
        }
        
        updateUI(value: value)
        
        lastValue = value
        rateSlider.value = Float(value)
        
    }
    
    @IBAction func touchCancel(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        rateSlider.isContinuous = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func moveX(value:Int,object:UILabel) {
        
        let xMove = rateSlider.frame.width / 7
        
        UIView.animate(withDuration: 0.2) {
            object.center.x += CGFloat(value) * xMove
        }
    }
    
    func updateUI(value:Int) {
        
        let number = value - 1
        
        UIView.animate(withDuration: 0.2) {
            self.rateSlider.tintColor = self.colorArray[number]
            self.rateLabel.layer.borderColor = self.colorArray[number].cgColor
            self.rateLabel.textColor = self.colorArray[number]
            self.rateLabel.text = self.textArray[number]
            self.emojiLabel.text = self.emojiArray[number]
            self.emojiLabel.backgroundColor = self.colorArray[number]
            
        }
        
    }
    
}
