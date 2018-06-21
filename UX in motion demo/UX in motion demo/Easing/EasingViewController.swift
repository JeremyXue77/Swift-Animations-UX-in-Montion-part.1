//
//  EasingViewController.swift
//  UX in motion demo
//
//  Created by JeremyXue on 2018/6/19.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

class EasingViewController: UIViewController {

    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var whiteView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(withTimeInterval: 4, repeats: true) { (timer) in
            
            // RedView Animate
            UIView.animate(withDuration: 2, delay: 0, options: UIViewAnimationOptions.curveLinear, animations: {
                self.redView.center.y += 400
            }, completion: { (finish) in
                self.redView.center.y -= 400
            })
            
            // WhiteView Animate
            UIView.animate(withDuration: 2, delay: 0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
                self.whiteView.center.y += 400
            }, completion: { (finish) in
                self.whiteView.center.y -= 400
            })
            }.fire()

        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
