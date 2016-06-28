//
//  ViewController.swift
//  YFScaleScrollView-Swift
//
//  Created by 孙云 on 16/6/28.
//  Copyright © 2016年 haidai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let scrollView:YFScrollView = YFScrollView.init(frame: self.view.bounds)
        let array:[String] = ["1.jpg","2","3.jpg"]
        scrollView.giveDataArray(array)
        self.view.addSubview(scrollView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

