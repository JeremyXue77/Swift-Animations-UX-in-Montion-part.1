//
//  EasingDemoViewController.swift
//  UX in motion demo
//
//  Created by JeremyXue on 2018/6/19.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

class EasingDemoViewController: UIViewController {

    @IBOutlet weak var alertView: UIView!
    
    @IBAction func check(_ sender: Any) {
        showView()
    }
    
    @IBAction func buy(_ sender: Any) {
        hideView()
        showMessage(message: "豆芽好感度提升", delay: 0, moveY: 100)
        showMessage(message: "日安好感度下降", delay: 1, moveY: 50)
        
    }
    
    @IBAction func ok(_ sender: Any) {
        hideView()
        showMessage(message: "買得這麼不甘不願", delay: 0, moveY: 100)
        showMessage(message: "買了，但好感度下降", delay: 1, moveY: 50)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.alertView.transform = CGAffineTransform(scaleX: 0.01, y: 0)
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Alret message view
    
    func hideView() {
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.alertView.transform = CGAffineTransform(scaleX: 0.01, y: 0)
        }, completion: nil)
    }
    
    func showView() {
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.alertView.transform = CGAffineTransform.identity
        }, completion: nil)
    }
    
    func showMessage(message:String,delay:Double,moveY:CGFloat) {
        
        let messageLabel = UILabel()
        messageLabel.frame = CGRect(x: 0, y: 0, width: 160, height: 40)
        messageLabel.center = view.center
        messageLabel.backgroundColor = UIColor.black
        messageLabel.textColor = UIColor.white
        messageLabel.textAlignment = NSTextAlignment.center
        messageLabel.text = message
        messageLabel.alpha = 0
        
        view.addSubview(messageLabel)
        
        UIView.animate(withDuration: 0.4, delay: delay, options: UIViewAnimationOptions.curveEaseIn, animations: {
            messageLabel.alpha = 1
            messageLabel.center.y -= moveY
        }) { (finish) in
            UIView.animate(withDuration: 1, animations: {
                messageLabel.alpha = 0
            }, completion: { (finish) in
                messageLabel.removeFromSuperview()
                self.hideView()
            })
        }
        
    }
    
    
    
    

}
