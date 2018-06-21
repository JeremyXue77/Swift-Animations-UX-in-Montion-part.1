//
//  TransformationViewController.swift
//  UX in motion demo
//
//  Created by JeremyXue on 2018/6/21.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

class TransformationViewController: UIViewController {

    @IBOutlet weak var downloadButton: UIButton! {
        didSet {
            downloadButton.layer.cornerRadius = downloadButton.frame.height / 2
            downloadButton.clipsToBounds = true
            downloadButton.layer.borderWidth = 3
            downloadButton.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    @IBAction func download(_ sender: UIButton) {
        
        UIView.animate(withDuration: 1, animations: {
            self.downloadButton.setTitle("OK", for: UIControlState.normal)
            self.downloadButton.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
            self.downloadButton.center = self.view.center
            self.downloadButton.backgroundColor = UIColor.white
        }) { (finish) in
            UIView.animate(withDuration: 1, animations: {
                self.downloadButton.setTitle("", for: UIControlState.normal)
                self.downloadButton.layer.cornerRadius = 0
                self.downloadButton.transform = CGAffineTransform(rotationAngle: .pi)
                self.downloadButton.transform = CGAffineTransform.identity
            }, completion: { (finish) in
                UIView.animate(withDuration: 1, animations: {
                    self.downloadButton.backgroundColor = UIColor.clear
                    self.downloadButton.frame = CGRect(x: 0, y: 0, width: 180, height: 60)
                    self.downloadButton.center = self.view.center
                    self.downloadButton.setTitle("Loading", for: UIControlState.normal)
                }, completion: { (finish) in
                    self.loadingAnimation()
                })
            })
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    func loadingAnimation() {
        
        let loadingView = UIView()
        loadingView.frame = CGRect(x: downloadButton.frame.minX, y: downloadButton.frame.minY, width: 0, height: downloadButton.frame.height)
        loadingView.backgroundColor = #colorLiteral(red: 0.4500938654, green: 0.9813225865, blue: 0.4743030667, alpha: 1)
        
        view.insertSubview(loadingView, at: 0)
        
        UIView.animate(withDuration: 3, animations: {
            loadingView.frame = self.downloadButton.frame
        }) { (finish) in
            UIView.animate(withDuration: 2, animations: {
                self.downloadButton.setTitle("Complete 👌🏻", for: UIControlState.normal)
                self.downloadButton.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
                self.downloadButton.layer.cornerRadius = self.downloadButton.frame.height / 2
                loadingView.removeFromSuperview()
            }, completion: { (finish) in
                
            })
        }
    }

}
