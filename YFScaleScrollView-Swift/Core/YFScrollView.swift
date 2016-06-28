//
//  YFScrollView.swift
//  YFScaleScrollView-Swift
//
//  Created by 孙云 on 16/6/28.
//  Copyright © 2016年 haidai. All rights reserved.
//

import UIKit
let K_TAG = 1000;
class YFScrollView: UIScrollView,UIScrollViewDelegate {

    //数据
    var dataArray:[String] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //数据赋予
    func giveDataArray(let array:[String]){
    
        dataArray = array
        //设置
        self.setScrollView()
    }
    func setScrollView(){
    
        let scrollView:UIScrollView = UIScrollView.init(frame: self.bounds)
        scrollView.delegate = self
        scrollView.contentSize = CGSizeMake(self.frame.size.width * CGFloat(dataArray.count), 0)
        scrollView.pagingEnabled = true
        self.addSubview(scrollView)
        //图片加载
        for i in 0..<(dataArray.count){
        
            let scaleView:YFScaleView = YFScaleView.init(frame: CGRectMake(CGFloat(i) * self.frame.size.width, 0, self.frame.size.width, self.frame.size.height))
            
            scaleView.tag = i + K_TAG
            scaleView.imageView?.image = UIImage.init(named: dataArray[i])
            scrollView.addSubview(scaleView)
        }
    }
    
    var lastIndex:Int = 0
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        //获得现在的偏移
        let index:CGFloat = scrollView.contentOffset.x / self.frame.size.width
        let scaleView:YFScaleView = self.viewWithTag(Int(index) + K_TAG) as! YFScaleView
        if Int(index) != lastIndex && scaleView.scaleScrollView?.zoomScale != 1 {
            scaleView.scaleScrollView?.setZoomScale(1.0, animated: true)
        }
        
        lastIndex = Int(index)
    }
}
