//
//  Transformation2ViewController.swift
//  UX in motion demo
//
//  Created by JeremyXue on 2018/6/21.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

class Transformation2ViewController: UIViewController {
    
    var isStart = false

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var iconImageView: UIImageView! {
        didSet {
            iconImageView.tintColor = UIColor.white
            iconImageView.layer.cornerRadius = iconImageView.frame.height / 2
            iconImageView.clipsToBounds = true
            iconImageView.layer.borderColor = UIColor.white.cgColor
            iconImageView.layer.borderWidth = 1
        }
    }
    @IBOutlet weak var signUpView: UIView! {
        didSet {
            signUpView.layer.cornerRadius = signUpView.frame.height / 2
            signUpView.clipsToBounds = true
            signUpView.layer.borderColor = UIColor.white.cgColor
            signUpView.layer.borderWidth = 1
        }
    }
    
    @IBAction func nextStep(_ sender: UIButton) {
        
        if isStart == false {
            isStart = true
            passwordTextField.isEnabled = true
            signUpAnimation()
        } else {
            if passwordTextField.text != "Jeremy" {
                for i in 0...2 {
                    wrongInputAnimation(delayTimes: i)
                }
            } else {
                successAnimation()
            }
        }
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpView.frame = CGRect(x: 0, y: 0, width: 150, height: 44)
        signUpView.center = view.center
        
        iconImageView.center.x -= 50
        passwordTextField.center.x -= 50
        nextButton.center.x -= 50
        
        passwordTextField.isEnabled = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func signUpAnimation() {
        UIView.animate(withDuration: 0.4, animations: {
            self.passwordTextField.alpha = 0
        }) { (finish) in
            UIView.animate(withDuration: 1) {
                self.passwordTextField.alpha = 1
                self.iconImageView.center.x += 50
                self.passwordTextField.center.x += 100
                self.nextButton.center.x += 150
                self.passwordTextField.text = ""
                self.signUpView.frame = CGRect(x: 0, y: 0, width: 300, height: 44)
                self.signUpView.center = self.view.center
            }
        }
    }
    
    func wrongInputAnimation(delayTimes:Int) {
        UIView.animate(withDuration: 0.1, delay: 0.2 * Double(delayTimes), options: UIViewAnimationOptions.autoreverse, animations: {
            self.signUpView.center.x += 20
            self.iconImageView.transform = CGAffineTransform(rotationAngle: .pi / 4)
            self.iconImageView.transform = CGAffineTransform.identity
        }) { (finish) in
            self.signUpView.center.x -= 20
        }
    }
    
    func successAnimation() {
        UIView.animate(withDuration: 1, animations: {
            self.nextButton.isHidden = true
            self.iconImageView.center.x = self.nextButton.center.x
            self.passwordTextField.isEnabled = false
            self.passwordTextField.alpha = 0
        }) { (finish) in
            UIView.animate(withDuration: 2, animations: {
                self.iconImageView.isHidden = true
                self.passwordTextField.alpha = 1
                self.signUpView.backgroundColor = UIColor.white
                self.passwordTextField.textColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
                self.passwordTextField.text = "Welcome"
            }) { (finish) in
                UIView.animate(withDuration: 2, animations: {
                    self.signUpView.alpha = 0
                })
            }
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
