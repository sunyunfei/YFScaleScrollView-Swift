//
//  YFScaleView.swift
//  YFScaleScrollView-Swift
//
//  Created by 孙云 on 16/6/28.
//  Copyright © 2016年 haidai. All rights reserved.
//

import UIKit

class YFScaleView: UIView,UIScrollViewDelegate {

    var scaleScrollView:UIScrollView?
    var imageView:UIImageView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //设置scrollview
        self.setScrollView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //添加scrollview的设置
    func setScrollView(){
    
        scaleScrollView = UIScrollView.init(frame: self.bounds)
        scaleScrollView?.delegate = self
        scaleScrollView?.showsVerticalScrollIndicator = false
        scaleScrollView?.showsHorizontalScrollIndicator = false
        scaleScrollView?.minimumZoomScale = 0.5
        scaleScrollView?.maximumZoomScale = 2.0
        scaleScrollView?.zoomScale = 1.0
        scaleScrollView?.contentSize = CGSizeMake(self.frame.size.width, 0)
        self.addSubview(scaleScrollView!)
        //图片的加载
        imageView = UIImageView.init(frame: self.bounds)
        imageView?.userInteractionEnabled = true
        imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        scaleScrollView?.addSubview(imageView!)
        
        //给一个点击手势
        let tap:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(tagGesture(_:)))
        tap.numberOfTapsRequired = 2
        self.addGestureRecognizer(tap)
    }
    //手势方法
    func tagGesture(let sender:UITapGestureRecognizer)->(){
    
        //判断现在scrollview是不是放大状态
        if scaleScrollView?.zoomScale > 1.0 {
            scaleScrollView?.setZoomScale(1.0, animated: true)
        }else{
        
         //局部放大
         //获取手势点击位置
            let tagClick:CGPoint = sender.locationInView(self)
         scaleScrollView?.zoomToRect(CGRectMake(tagClick.x - 40, tagClick.y - 40, 80, 80), animated: true)
        }
    }
    
    //代理方法
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView?{
       
        return imageView;
    }
}
