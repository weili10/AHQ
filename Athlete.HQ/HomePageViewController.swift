//
//  HomePageViewController.swift
//  Athlete.HQ
//
//  Created by Wei Li on 13/3/18.
//  Copyright © 2018 Wei Li. All rights reserved.
//

import UIKit

class HomePageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    lazy var subViewControllers:[UIViewController] = {
        return [ self.newVC(viewController: "FeedNavigationController"),
                 self.newVC(viewController: "MessageNavigationController")
        ]
    }()

    var pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.dataSource = self
        if let firstViewController = subViewControllers.first{
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        
        self.delegate = self
        configuePageControl()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    func configuePageControl(){
        pageControl = UIPageControl(frame: CGRect(x:0, y:UIScreen.main.bounds.maxY-100, width:UIScreen.main.bounds.width, height:50))
        pageControl.numberOfPages = subViewControllers.count
        pageControl.currentPage = 0
        pageControl.tintColor = UIColor.black
        pageControl.pageIndicatorTintColor = UIColor.white
        pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
    }
    
    //MARK: UIPageViewControllerDataSource
    
    func newVC(viewController: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewController)
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewControllers.count
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex:Int = subViewControllers.index(of: viewController) else {
            return nil
        }
        let previousIndex = currentIndex - 1
        
        guard previousIndex >= 0 else {
//            return subViewControllers.last
            return nil
        }

        return subViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex:Int = subViewControllers.index(of: viewController) else{
            return nil
        }
        let nextIndex = currentIndex + 1
        
        guard subViewControllers.count > nextIndex else{
//            return subViewControllers.first
            return nil
        }
        
        return subViewControllers[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = subViewControllers.index(of: pageContentViewController)!
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
