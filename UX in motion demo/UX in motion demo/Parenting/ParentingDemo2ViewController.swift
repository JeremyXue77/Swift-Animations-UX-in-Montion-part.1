//
//  ParentingDemo2ViewController.swift
//  UX in motion demo
//
//  Created by JeremyXue on 2018/6/21.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

class ParentingDemo2ViewController: UIViewController {
    
    let imageArray = ["橘貓","白貓","虎斑","乳牛","黑貓"]
    
    var currentNum = 2
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var introduceImage: UIImageView!
    @IBOutlet var catButtons: [UIButton]! {
        didSet {
            for button in catButtons {
                button.layer.cornerRadius = button.frame.height / 3
                button.clipsToBounds = true
                button.layer.borderColor = UIColor.white.cgColor
                button.layer.borderWidth = 3
            }
        }
    }
    
    @IBOutlet weak var catStackView: UIStackView!
    
    @IBAction func moveStackView(_ sender: UIButton) {
        
        if sender.tag == currentNum {
            return
        }
        
        currentNum = sender.tag
        
        let moveX = self.catStackView.center.x - sender.center.x
        
        UIView.animate(withDuration: 0.2, animations: {
            for button in self.catButtons {
                button.center.x += moveX
            }
        }) { (finish) in
            UIView.animate(withDuration: 0.2, animations: {
                for button in self.catButtons {
                    button.transform = CGAffineTransform.identity
                }
                self.changeIntroduceImage(number: sender.tag)
                sender.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            })
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for botton in catButtons {
            if botton.tag == 2{
                botton.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                return
            }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changeIntroduceImage(number:Int) {
        UIView.animate(withDuration: 0.4, animations: {
            self.introduceImage.alpha = 0
        }) { (finish) in
            UIView.animate(withDuration: 0.4, animations: {
                self.introduceImage.image = UIImage(named: "台灣常見貓咪介紹-\(self.imageArray[number])")
                self.titleLabel.text = "台灣常見貓咪介紹-\(self.imageArray[number])"
                self.introduceImage.alpha = 1
            })
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
