//
//  ViewController.swift
//  BeautyJigsaw
//
//  Created by 楊文興 on 2018/6/2.
//  Copyright © 2018年 楊文興. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var headScrollView: UIScrollView!
    @IBOutlet weak var bodyScrollView: UIScrollView!
    @IBOutlet weak var footScrollView: UIScrollView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let imageWidth = headScrollView.frame.width
        headScrollView.contentSize = CGSize(width: imageWidth * 3, height: headScrollView.frame.height)
        bodyScrollView.contentSize = CGSize(width: imageWidth * 3, height: bodyScrollView.frame.height)
        footScrollView.contentSize = CGSize(width: imageWidth * 3, height: footScrollView.frame.height)
        var x: CGFloat = 0
        var y: CGFloat = 0
        var z: CGFloat = 0
        for i in 1...3{
            let frame = CGRect(x: x, y: 0, width: imageWidth, height: headScrollView.frame.height)
            let frame2 = CGRect(x: y, y: 0, width: imageWidth, height: bodyScrollView.frame.height)
            let frame3 = CGRect(x: z, y: 0, width: imageWidth, height: footScrollView.frame.height)
            let imageView = UIImageView(frame:frame)
            let imageView2 = UIImageView(frame: frame2)
            let imageView3 = UIImageView(frame: frame3)
            imageView.clipsToBounds = true
            imageView2.clipsToBounds = true
            imageView3.clipsToBounds = true
            imageView.image = UIImage(named: "head\(i)")
            imageView2.image = UIImage(named: "body\(i)")
            imageView3.image = UIImage(named: "foot\(i)")
            headScrollView.addSubview(imageView)
            bodyScrollView.addSubview(imageView2)
            footScrollView.addSubview(imageView3)
            x = x + imageWidth
            y = y + imageWidth
            z = z + imageWidth
        }
        
        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { (_) in
            var offsetX = self.headScrollView.contentOffset.x + self.headScrollView.frame.width
            
            if offsetX == self.headScrollView.contentSize.width {
                offsetX = 0
            }
            self.headScrollView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
        }
        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (_) in
            var offsetX = self.bodyScrollView.contentOffset.x + self.bodyScrollView.frame.width
            
            if offsetX == self.bodyScrollView.contentSize.width {
                offsetX = 0
            }
            self.bodyScrollView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
        }
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
            var offsetX = self.footScrollView.contentOffset.x + self.footScrollView.frame.width
            
            if offsetX == self.footScrollView.contentSize.width {
                offsetX = 0
            }
            self.footScrollView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

