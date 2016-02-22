//
//  StickViewController.swift
//  MeecaaStickSwift
//
//  Created by SoulJa on 16/2/22.
//  Copyright © 2016年 SoulJa. All rights reserved.
//

import UIKit

class StickViewController: UIViewController,UIScrollViewDelegate {
    var myPageControl = UIPageControl()
    var myScrollView = UIScrollView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /*设置Nav*/
        self.setupNav()
        
        /*设置Views*/
        self.setupViews()
    }
    
    /**
    *   设置Nav
    */
    func setupNav() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "back_icon"), style: .Done, target: self, action: Selector("goBack"))
        self.navigationItem.title = "米开体温棒"
    }
    
    /**
    *    返回上一级
    */
    func goBack() {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    /**
     *   设置Views
     */
    func setupViews() {
        /*背景颜色*/
        self.view.backgroundColor = UIColor.whiteColor()
        
        /*scrollView*/
        let scrollView = UIScrollView(frame: self.view.bounds)
        scrollView.contentSize = CGSizeMake(kScreen_Width * 2, kScreen_Height)
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.pagingEnabled = true
        scrollView.delegate = self
        self.view.addSubview(scrollView)
        self.myScrollView = scrollView
        /*建立ScrollView的子视图*/
        self.setupQuickCheckView()
        
        
        /*pageControl*/
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 2
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.orangeColor()
        pageControl.currentPageIndicatorTintColor = UIColor.greenColor()
        pageControl.addTarget(self, action: Selector("onClickPageControl:"), forControlEvents: .TouchUpInside)
        self.view.addSubview(pageControl)
        pageControl.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(self.view)
            make.width.equalTo(100)
            make.height.equalTo(30)
            make.topMargin.equalTo(self.view)
        }
        self.myPageControl = pageControl
    }
    
    func onClickPageControl(pageControl:UIPageControl)->() {
        if (pageControl.currentPage == 0) {
            self.myScrollView.setContentOffset(CGPointMake(0, 0), animated: true)
        } else if(pageControl.currentPage == 1) {
            self.myScrollView.setContentOffset(CGPointMake(kScreen_Width, 0), animated: true)
        }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if (scrollView.contentOffset.x >= kScreen_Width) {
            self.myPageControl.currentPage = 1
        } else {
            self.myPageControl.currentPage = 0
        }
    }
    
    func setupQuickCheckView() {
        let quickView = UIView(frame: CGRectMake(0,0,kScreen_Width,kScreen_Height))
        quickView.backgroundColor = UIColor.redColor()
        self.myScrollView.addSubview(quickView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
