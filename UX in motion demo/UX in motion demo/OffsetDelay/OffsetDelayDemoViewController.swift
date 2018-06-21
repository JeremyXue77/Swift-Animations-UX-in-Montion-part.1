//
//  OffsetDelayDemoViewController.swift
//  UX in motion demo
//
//  Created by JeremyXue on 2018/6/19.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

class OffsetDelayDemoViewController: UIViewController {
    
    var moreButtonOrigin:CGPoint?
    
    var isPushed = false
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var upButton: UIButton!
    
    @IBOutlet weak var editView: UIView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var settingView: UIView!
    
    @IBOutlet var circleButtonCollection: [UIButton]! {
        didSet {
            for button in circleButtonCollection {
                button.layer.cornerRadius = button.frame.height / 2
                button.clipsToBounds = true
                button.layer.borderColor = UIColor.white.cgColor
                button.layer.borderWidth = 3
            }
        }
    }
    
    @IBOutlet var textFieldCollection: [UITextField]! {
        didSet {
            for textField in textFieldCollection {
                textField.isHidden = true
                textField.alpha = 0
                textField.layer.borderWidth = 1
                textField.layer.borderColor = UIColor.white.cgColor
            }
        }
    }
    
    @IBAction func showMoreAction(_ sender: Any) {
        
        moreButtonOrigin = moreButton.center
        
        if isPushed {
            pushSettingView(sender)
        }
        
        UIView.animate(withDuration: 0.4, animations: {
            self.moreButton.center = self.myImage.center
        }) { (finish) in
            UIView.animate(withDuration: 0.2, animations: {
                self.moreButton.layer.cornerRadius = 0
                self.moreButton.layer.borderColor = UIColor.clear.cgColor
                self.moreButton.frame = self.myImage.frame
                self.editView.alpha = 0.9
            }) { (finish) in
                UIView.animate(withDuration: 0.2, animations: {
                    self.moreButton.alpha = 0
                })
            }
        }
    }
    
    @IBAction func exitEditView(_ sender: Any) {
        UIView.animate(withDuration: 0.2, animations: {
            self.moreButton.alpha = 1
        }) { (finish) in
            UIView.animate(withDuration: 0.2, animations: {
                self.editView.alpha = 0
                self.moreButton.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
                self.moreButton.center = self.myImage.center
                self.moreButton.layer.borderColor = UIColor.white.cgColor
                self.moreButton.layer.cornerRadius = self.moreButton.frame.height / 2
            }) { (finish) in
                UIView.animate(withDuration: 0.2, animations: {
                    self.moreButton.center = self.moreButtonOrigin!
                })
            }
        }
    }
    
    
    @IBAction func pushSettingView(_ sender: Any) {
        
        if editView.alpha != 0 {
            exitEditView(sender)
        }
        
        let moveDistance = self.view.frame.height / 5 * 2
        if isPushed == false {
            moveView(moveY: -moveDistance)
        } else {
            moveView(moveY: moveDistance)
        }
        
        isPushed = !isPushed
    }
    
    @IBAction func changePhoto(_ sender: Any) {
        
        if myImage.image == #imageLiteral(resourceName: "cat") {
            myImage.image = #imageLiteral(resourceName: "cat2")
        } else {
            myImage.image = #imageLiteral(resourceName: "cat")
        }
        
        exitEditView(sender)
    }
    
    @IBAction func editEnable(_ sender: Any) {
        
        if textFieldCollection[0].isHidden == true {
            UIView.animate(withDuration: 1) {
                for textField in self.textFieldCollection {
                    textField.alpha = 1
                    textField.isHidden = false
                }
            }
        } else {
            UIView.animate(withDuration: 1) {
                for textField in self.textFieldCollection {
                    textField.isHidden = true
                    textField.alpha = 0
                }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editView.alpha = 0
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func moveView(moveY:CGFloat) {
        
        UIView.animate(withDuration: 0.8) {
            if self.isPushed {
                self.upButton.transform = CGAffineTransform.identity
            } else {
                self.upButton.transform = CGAffineTransform(rotationAngle: .pi)
            }
        }
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            self.myImage.center.y += moveY
            self.editView.center.y += moveY
            self.infoView.center.y += moveY
            self.settingView.center.y += moveY
        })
    }
    
}
