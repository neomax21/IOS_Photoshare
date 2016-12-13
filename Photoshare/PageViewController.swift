//
//  PageViewController.swift
//  Photoshare
//
//  Created by André da Silva on 12/12/16.
//  Copyright © 2016 Photoshare_Team. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    lazy var VCarr: [UIViewController] = {
        return [self.VCInstance(name: "MapView"), self.VCInstance(name: "OptionsView"), self.VCInstance(name: "CameraView")]
    }()
    
    private func VCInstance(name: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        
        if let MapView = VCarr.first {
            setViewControllers([MapView], direction: .forward, animated: true, completion: nil)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for view in self.view.subviews {
            if view is UIScrollView {
                view.frame = UIScreen.main.bounds
            } else if view is UIPageControl {
                view.backgroundColor = UIColor.clear
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = VCarr.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return VCarr.last
        }
        
        guard VCarr.count > previousIndex else {
            return nil
        }
        
        return VCarr[previousIndex]
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = VCarr.index(of: viewController) else {
            return nil
        }
    
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex < VCarr.count else {
            return VCarr.first
        }
        
        guard VCarr.count > nextIndex else {
            return nil
        }
        
        return VCarr[nextIndex]
    }

}
